<?php

namespace App\Controllers;

use App\Models\User;
use App\Models\PasswordReset;
use App\Services\Password;
use App\Utils\Hash;

/***
 * Class Password
 * @package App\Controllers
 * 密码重置
 */
class PasswordController extends BaseController
{
    public function reset()
    {
        return $this->view()->display('password/reset.tpl');
    }

    public function handleReset($request, $response, $args)
    {
        $email = $request->getParam('email');
        // check limit

        // send email
        $user = User::where('email', $email)->first();
        if ($user == null) {
            $rs['ret'] = 0;
            $rs['msg'] = 'このメールアドレスは存在しません';
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = 'メールを送信しましたので、ご確認ください。';
        if (Password::sendResetEmail($email)) {
            $res['msg'] = 'メールの送信に失敗しました。管理者にご連絡ください。';
        }

        return $response->getBody()->write(json_encode($rs));
    }

    public function token($request, $response, $args)
    {
        $token = $args['token'];
        return $this->view()->assign('token', $token)->display('password/token.tpl');
    }

    public function handleToken($request, $response, $args)
    {
        $tokenStr = $args['token'];
        $password = $request->getParam('password');
        $repasswd = $request->getParam('repasswd');

        if ($password != $repasswd) {
            $res['ret'] = 0;
            $res['msg'] = 'パスワードが一致しません';
            return $response->getBody()->write(json_encode($res));
        }

        if (strlen($password) < 8) {
            $res['ret'] = 0;
            $res['msg'] = 'パスワードが短すぎます';
            return $response->getBody()->write(json_encode($res));
        }

        // check token
        $token = PasswordReset::where('token', $tokenStr)->orderBy('id', 'desc')->first();
        if ($token == null || $token->expire_time < time()) {
            $rs['ret'] = 0;
            $rs['msg'] = 'リンクの有効期限が切れています。再度やり直してください';
            return $response->getBody()->write(json_encode($rs));
        }

        $user = User::where('email', $token->email)->first();
        if ($user == null) {
            $rs['ret'] = 0;
            $rs['msg'] = 'リンクの有効期限が切れています。再度やり直してください';
            return $response->getBody()->write(json_encode($rs));
        }

        // reset password
        $hashPassword = Hash::passwordHash($password);
        $user->pass = $hashPassword;
        $user->ga_enable = 0;
        if (!$user->save()) {
            $rs['ret'] = 0;
            $rs['msg'] = '再設定に失敗しました。再度やり直してください';
            return $response->getBody()->write(json_encode($rs));
        }
        $rs['ret'] = 1;
        $rs['msg'] = '再設定が完了しました';

        $user->clean_link();

        return $response->getBody()->write(json_encode($rs));
    }
}

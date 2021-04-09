<!DOCTYPE html>
<html lang="ja">

<head>
  {include file='user/head.tpl'}

  <title>macOSでの使用方法 &mdash; {$config["appName"]}</title>

  <style>
    .btn-app {
      background: linear-gradient(to right, #71ba35, #2ba255) !important;
      color: white !important;
      border: none;
      box-shadow: 0 2px 6px #71ba3579;
      margin-bottom: 16px;
    }

    .card a {
      color: #2ba255;
    }

    .steps {
      margin: 10px;
      padding: 0px;
    }

    li {
      list-style: none;
    }

    .step-no {
      font-size: 30px;
      font-weight: 700;
      color: #2ba255;
    }

    .right-pic {
      text-align: right;
    }

    .tutorial-pic img {
      border-radius: 5px;
      width: 100%;
      max-width: 24rem;
    }

    @media (max-width: 767px) {
      .right-pic {
        display: block;
      }

      .tutorial-pic img {
        margin-top: 16px;
        border-radius: 5px;
        max-width: 100%;
      }

      .qrcode-btn {
        display: none
      }

      .hide-on-mobie {
        display: none;
      }
    }

    .faq h6 {
      color: #191d21;
    }

    .faq h6:before {
      content: ' ';
      border-radius: 5px;
      height: 6px;
      width: 6px;
      background-color: #3B92F8;
      display: inline-block;
      float: left;
      margin-top: 6px;
      margin-right: 8px;
    }

    .faq p {
      font-weight: normal !important;
    }
  </style>

</head>

<body>
  <div id="app">
    <div class="main-wrapper">
      {include file='user/navbar.tpl'}

      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-header">
            <div class="section-header-back">
              <a href="/user/tutorial" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
            </div>
            <h1>macOSでの使用方法</h1>
            {if $malio_config['display_more_app_button'] == true}
            <div class="section-header-breadcrumb">
              <div class="btn-group dropleft">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  其他客户端
                </button>
                <div class="dropdown-menu dropleft">
                  <a class="dropdown-item has-icon" href="/user/tutorial?os=mac&client=clashx"><i class="malio-clash"></i>ClashX</a>
                </div>
              </div>
            </div>
            {/if}
          </div>
          <div class="section-body">
            <div class="row mt-sm-4">
              <div class="col-12">
                {if !URL::SSRCanConnect($user, $mu)}
                <div class="alert alert-warning alert-has-icon">
                  <div class="alert-icon"><i class="fas fa-exclamation-triangle"></i></div>
                  <div class="alert-body">
                    <div class="alert-title">无法使用此客户端</div>
                    您的加密、混淆和协议不兼容 SSR 客户端。如需使用，请在 <a href="/user/edit"><u>连接设置</u></a> 页面更改 “加密方式”、“混淆和协议” 为 SSR 可连接的选项。
                  </div>
                </div>
                {/if}
                <div class="card">
                  <div class="card-body">
                    <ul class="steps">
                      <li>
                        <div class="row">
                          <div class="left-text col-xs-12 col-md-6 col-lg-6">
                            <label class="step-no">1.</label>
                            <p>まずは「ShawdowsockX-NG-R8」をダウンロードして、インストールし、右クリックで「開く」を選択後再度「開く」を選択してください。その後パスワードを入力してください。(インストール方法: ダウンロードフォルダ内の「ShadowsocksX-NG-R8」をドラッグ等でアプリケーションに移動)</p>
                            <a href="https://github.com/paradiseduo/ShadowsocksX-NG-R8/releases/download/1.7.2/ShadowsocksX-NG-R.zip" class="btn btn-icon icon-left btn-primary btn-app btn-lg btn-round" target="blank"><i class="fas fa-download"></i> ダウンロード</a>
                          </div>
                          <div class="right-pic col-xs-12 col-md-6 col-lg-6">
                            <div class="tutorial-pic hide-on-mobie">
                              <img style="border:1px solid #f0f0f0" src="/theme/malio/img/tutorial/macos-ssr-1.png">
                              <img style="border:1px solid #f0f0f0" src="/theme/malio/img/tutorial/macos-ssr-2.png">
                            </div>
                          </div>
                        </div>
                      </li>
                      <li>
                        <hr>
                        <div class="row">
                          <div class="left-text col-xs-12 col-md-6 col-lg-6">
                            <label class="step-no">2.</label>
                            <p>画面右上にある飛行機マークをクリックし、「Subscribers」にカーソルを合わせ、「Edit Subscribers Feed」をクリック後出てきたウィンドウ内の左下の[+]をクリックし、URLの項目にサブスクリプションリンクを入力して、「Group」に {$config['appName']} と入力して「OKボタン」を押してください。</p>
                            <a href="##" class="btn btn-icon icon-left btn-primary btn-app btn-lg btn-round copy-text" data-clipboard-text="{$subInfo['ssr']}{if $malio_config['enable_sub_extend'] == true}&extend=1{/if}"><i class="malio-ssr"></i> サブスクリプションリンクをコピー</a>
                          </div>
                          <div class="right-pic col-xs-12 col-md-6 col-lg-6">
                            <div class="tutorial-pic">
                              <img src="/theme/malio/img/tutorial/macos-ssr-3.png">
                            </div>
                          </div>
                        </div>
                      </li>
                      <li>
                        <hr>
                        <div class="row">
                          <div class="left-text col-xs-12 col-md-6 col-lg-6">
                            <label class="step-no">3.</label>
                            <p>再度右上の飛行機マークをクリックし、「Subscribers」→「Update Subscription Without Proxu」をクリックしてください</p>
                          </div>
                          <div class="right-pic col-xs-12 col-md-6 col-lg-6">
                            <div class="tutorial-pic">
                              <img style="border:1px solid #f0f0f0" src="/theme/malio/img/tutorial/macos-ssr-4.png">
                            </div>
                          </div>
                        </div>
                      </li>
                      <li>
                        <hr>
                        <div class="row">
                          <div class="left-text col-xs-12 col-md-6 col-lg-6">
                            <label class="step-no">4.</label>
                            <p>通知が表示され、飛行機マークから「残り使用量: XXGB」にカーソルを合わせるとサーバー一覧が出てくれば成功です。サーバーを選択後「ACL Mode」から「Proxy Back China」で中国のみプロキシさせるといった方法や「Global Mode」で全通信をプロキシさせる事ができるようになります</p>
                          </div>
                          <div class="right-pic col-xs-12 col-md-6 col-lg-6">
                            <div class="tutorial-pic">
                              <img style="border:1px solid #f0f0f0" src="/theme/malio/img/tutorial/macos-ssr-5.png">
                            </div>
                          </div>
                        </div>
                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
      {include file='user/footer.tpl'}
    </div>
  </div>

  {include file='user/scripts.tpl'}

</body>

</html>
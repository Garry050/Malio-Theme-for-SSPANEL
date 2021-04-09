<!DOCTYPE html>
<html lang="en">

<head>
  {include file='user/head.tpl'}

  <title>Windowsでゲームで使用する場合 &mdash; {$config["appName"]}</title>

  <style>
    .btn-app {
      background: linear-gradient(to right, #2669b5, #2d97d5) !important;
      color: white !important;
      border-color: #2d97d5;
      box-shadow: 0 2px 6px #2d97d5b0;
      margin-bottom: 16px;
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
      color: #2975bd;
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
      background-color: #2975bd;
      display: inline-block;
      float: left;
      margin-top: 6px;
      margin-right: 8px;
    }

    .faq p {
      font-weight: normal !important;
    }

    .card a {
      color: #2975bd;
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
            <h1>Windowsでゲームで使用する場合</h1>
            {if $malio_config['display_more_app_button'] == true}
            <div class="section-header-breadcrumb">
              <div class="btn-group dropleft">
                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  其他客户端
                </button>
                <div class="dropdown-menu dropleft">
                  <a class="dropdown-item has-icon" href="/user/tutorial?os=windows&client=cfw"><i class="malio-clash"></i>Clash for Windows</a>
                </div>
              </div>
            </div>
            {/if}
          </div>
          <div class="section-body">
            <div class="row mt-sm-4">
              <div class="col-12">
                <div class="card">
                  <div class="card-body">
                    <ul class="steps">
                      <li>
                        <div class="row">
                          <div class="left-text col-xs-12 col-md-6 col-lg-6">
                            <label class="step-no">1.</label>
                            <p>下記からNetchをダウンロードし、管理者としてNetch.exeを起動させてください。もし、NET Framrwork 4.0をインストールしていない場合は先に<a href="https://www.microsoft.com/net/download/dotnet-framework-runtime" target="blank">ここ</a>をクリックしてインストーラーをダウンロードし、.NET Framework 4.0をインストールしてからSSRクライアントを起動してください。</p>
                            <a href="/client-download/netch.7z" class="btn btn-icon icon-left btn-primary btn-app btn-lg btn-round" target="blank"><i class="fas fa-download"></i> ダウンロード</a>
                          </div>
                          <div class="right-pic col-xs-12 col-md-6 col-lg-6">
                            <div class="tutorial-pic hide-on-mobie">
                              <img style="border:1px solid #f0f0f0" src="/theme/malio/img/tutorial/windows-netch-1.jpg">
                            </div>
                          </div>
                        </div>
                      </li>
                      <li>
                        <hr>
                        <div class="row">
                          <div class="left-text col-xs-12 col-md-6 col-lg-6">
                            <label class="step-no">2.</label>
                            <p>起動後、「サブスクリプション」→「サブスクリプションリンクを管理」をクリックしてください</p>
                          </div>
                          <div class="right-pic col-xs-12 col-md-6 col-lg-6">
                            <div class="tutorial-pic">
                              <img src="/theme/malio/img/tutorial/windows-netch-2.png">
                            </div>
                          </div>
                        </div>
                      </li>
                      <li>
                        <hr>
                        <div class="row">
                          <div class="left-text col-xs-12 col-md-6 col-lg-6">
                            <label class="step-no">2.</label>
                            <p>下記からサブスクリプションリンクをコピーして「リンク」の項目に貼り付けてください。備考には「Gaming-SSR」または自分の好きな名前をつけて「新規」ボタンをクリックしてください。</p>
                            {if (in_array("ssr",$malio_config['support_sub_type']))}
                            <a href="##" class="btn btn-icon icon-left btn-primary btn-app copy-text btn-lg btn-round" data-clipboard-text="{$subInfo['ssr']}{if $malio_config['enable_sub_extend'] == true}&extend=1{/if}"><i class="malio-ssr"></i> SSRのサブスクリプションリンクをコピー</a>
                            {/if}
                            {if (in_array("v2ray",$malio_config['support_sub_type']))}
                            <a href="##" class="btn btn-icon icon-left btn-primary btn-app copy-text btn-lg btn-round" data-clipboard-text="{$subInfo['v2ray']}{if $malio_config['enable_sub_extend'] == true}&extend=1{/if}"><i class="malio-v2ray"></i> V2Rayのサブスクリプションリンクをコピー</a>
                            {/if}
                            {if (in_array("ss",$malio_config['support_sub_type']))}
                            <a href="##" class="btn btn-icon icon-left btn-primary btn-app copy-text btn-lg btn-round" data-clipboard-text="{$subInfo['ss']}{if $malio_config['enable_sub_extend'] == true}&extend=1{/if}"><i class="malio-ssr"></i> SSのサブスクリプションリンクをコピー</a>
                            {/if}
                          </div>
                          <div class="right-pic col-xs-12 col-md-6 col-lg-6">
                            <div class="tutorial-pic">
                              <img src="/theme/malio/img/tutorial/windows-netch-3.png">
                            </div>
                          </div>
                        </div>
                      </li>
                      <li>
                        <hr>
                        <div class="row">
                          <div class="left-text col-xs-12 col-md-6 col-lg-6">
                            <label class="step-no">3.</label>
                            <p>その後再度「サブスクリプション」から「サブスクリプションからサーバー設定を更新」をしてサーバー欄にGaming-SSRのサーバー一覧が出てくるのを確認してください。</p>
                          </div>
                          <div class="right-pic col-xs-12 col-md-6 col-lg-6">
                            <div class="tutorial-pic">
                              <img style="border:1px solid #f0f0f0" src="/theme/malio/img/tutorial/windows-netch-4.png">
                            </div>
                          </div>
                        </div>
                      </li>
                      <li>
                        <hr>
                        <div class="row">
                          <div class="left-text col-xs-12 col-md-6 col-lg-6">
                            <label class="step-no">4.</label>
                            <p>モード一覧に希望するゲーム名等がない場合は、「モード」→「新規プロファイル」からモードを自分で作成することができます。Selectまたはスキャンから対象のゲーム等のフォルダーを選択することで自動的に項目が追加されます。追加されたのを確認したら備考から名前を入力して「保存」で保存できます。</p>
                          </div>
                          <div class="right-pic col-xs-12 col-md-6 col-lg-6">
                            <div class="tutorial-pic">
                              <img style="border:1px solid #f0f0f0" src="/theme/malio/img/tutorial/windows-netch-5.png">
                            </div>
                          </div>
                        </div>
                      </li>
                      <li>
                        <hr>
                        <div class="row">
                          <div class="left-text col-xs-12 col-md-6 col-lg-6">
                            <label class="step-no">5.</label>
                            <p>これで準備は完了しました。サーバーとモードを選んで「起動」を押すことでゲームをプロキシ経由で遊ぶようにできます。(起動する前にゲームが動作している場合は最初にゲームを終了させてから起動してください。)</p>
                          </div>
                          <div class="right-pic col-xs-12 col-md-6 col-lg-6">
                            <div class="tutorial-pic">
                              <img style="border:1px solid #f0f0f0" src="/theme/malio/img/tutorial/windows-netch-6.png">
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
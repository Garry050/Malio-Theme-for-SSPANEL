<!DOCTYPE html>
<html lang="ja">

<head>
  {include file='user/head.tpl'}

  <title>支払い結果 &mdash; {$config["appName"]}</title>

</head>

<body>
  <div id="app">
    <div class="main-wrapper">
      {include file='user/navbar.tpl'}

      <!-- Main Content -->
      <div class="main-content">
        <section class="section">
          <div class="section-body">
            <!--
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  {if ($success == 1)}
                  <h5>已充值成功 {$money} 元</h5>
                  {else}
                  <h5>正在处理您的支付，请您稍等。此页面会自动刷新，或者您可以选择关闭此页面，余额将自动到账</h5>
                  <script>
                    setTimeout('window.location.reload()', 5000);
                  </script>
                  {/if}
                </div>
              </div>
            </div>
          -->

            <div class="row">
              <div class="col-12 col-md-12 col-sm-12">
                <div class="card">
                  <div class="card-body">
                    <div class="empty-state" data-height="600" style="height: 600px;">
                      <img class="img-fluid" src="/theme/malio/img/card_payment_online_1.svg" alt="image">
                      {if $success == 1}
                      <h2 class="mt-4">支払いを確認しました</h2>
                      <p class="lead">
                        あなたがお支払いした {$money} 円の支払いを確認しました。このページを閉じてください。
                      </p>
                      {else}
                      <h2 class="mt-4">お支払状況を確認しています。少々お待ち下さい。</h2>
                      <p class="lead">
                        支払いは現在確認中ですがこのページを閉じても問題はありません。
                      </p>
                      <script>
                        setTimeout('window.location.reload()', 5000);
                      </script>
                      {/if}
                      <a href="/user/code" class="mt-4 bb">アカウント情報に戻る 👉</a>
                    </div>
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
<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">

<!-- General CSS Files -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.8.2/css/all.min.css">

<!-- Template CSS -->
<link rel="stylesheet" href="/theme/malio/css/style-{$malio_config['theme_color']}.css">
<link rel="stylesheet" href="/theme/malio/assets/css/components.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="/theme/malio/css/malio.css">

{if $malio_config['google_analytics_code'] != ''}
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id={$malio_config['google_analytics_code']}"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  {literal}function gtag() {dataLayer.push(arguments);}{/literal}
  gtag('js', new Date());
  gtag('config', '{$malio_config['google_analytics_code']}');
</script>
{/if}

{if $config["sspanelAnalysis"] == 'true'}
<!-- Google Analytics -->
<script>
    window.ga = window.ga || function () {
        (ga.q = ga.q || []).push(arguments)
    };
    ga.l = +new Date;
    ga('create', 'UA-143778338-1', 'auto');
    var hostDomain = window.location.host || document.location.host || document.domain;
    ga('set', 'dimension1', hostDomain);
    ga('send', 'pageview');
    (function () {
        function perfops() {
            var js = document.createElement('script');
            js.src = 'https://cdn.jsdelivr.net/npm/perfops-rom';
            document.body.appendChild(js);
        }
        if (document.readyState === 'complete') {
            perfops();
        } else {
            window.addEventListener('load', perfops);
        }
    })();
</script>
<script async src="https://www.google-analytics.com/analytics.js"></script>
<!-- End Google Analytics -->
{/if}


  <title>サーバー情報 &mdash; {$config["appName"]}</title>

</head>

<body style="background: #fff;overflow-x:hidden;">
  <div id="app">
    <div class="main-wrapper">
      <ul class="nav nav-tabs" id="myTab" role="tablist">
        {if $node->sort == 14}
        <li class="nav-item">
          <a class="nav-link" id="trojan-tab" data-toggle="tab" href="#trojan" role="tab" aria-controls="trojan" aria-selected="true">Trojan</a>
        </li>
        {elseif (in_array("ssr",$malio_config['support_sub_type']))}
        {if $node->mu_only != 1}
        <li class="nav-item">
          <a class="nav-link active" id="ssr-tab" data-toggle="tab" href="#ssr" role="tab" aria-controls="ssr" aria-selected="true">ShadowsocksR</a>
        </li>
        {/if}
        {$first_mu_node_one = true}
        {foreach $nodes_muport as $single_muport}
          {if !($single_muport['server']->node_class <= $user->class && ($single_muport['server']->node_group == 0 || $single_muport['server']->node_group == $user->node_group))}
              {continue}
          {/if}

          {if !($single_muport['user']->class >= $node['class'] && ($node['group'] == 0 || $single_muport['user']->node_group == $node['group']))}
              {continue}
          {/if}
          <li class="nav-item">
            <a class="nav-link {if $node->mu_only == 1 and $first_mu_node_one == ture}active{/if}" id="ssr-{$single_muport['server']->server}-tab" data-toggle="tab" href="#ssr-{$single_muport['server']->server}" role="tab" aria-controls="ss-{$single_muport['server']->server}" aria-selected="{if $node->mu_only == 1 and $first_mu_node_one == ture}ture{$first_mu_node_one = false}{else}false{/if}">ShadowsocksR ({$single_muport['server']->server}【単一ポート】)</a>
          </li>
        {/foreach}
        {/if}
        {if (in_array("ss",$malio_config['support_sub_type'])) && $node->mu_only != 1}
        <li class="nav-item">
          <a class="nav-link" id="ss-tab" data-toggle="tab" href="#ss" role="tab" aria-controls="ss" aria-selected="false">Shadowsocks</a>
        </li>
        {/if}
      </ul>
      <div class="tab-content" id="myTabContent">
        {if $node->sort == 14}
        <div class="tab-pane fade active show" id="trojan" role="tabpanel" aria-labelledby="trojan-tab">
          <div class="row mt-2">
            <div class="col-12 col-sm-3 col-md-3">
              <ul class="nav nav-pills flex-column" id="myTab4" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="trojan-info-tab" data-toggle="tab" href="#trojan-info" role="tab" aria-controls="trojan-info" aria-selected="true">サーバー情報</a>
                </li>
              </ul>
            </div>
            <div class="col-12 col-sm-9 col-md-9">
              <div class="tab-content no-padding" id="myTab2Content">
                <div class="tab-pane fade active show" id="trojan-info" role="tabpanel" aria-labelledby="trojan-info-tab">
                  {$sort14Node = URL::getTrojanItem($user, $node, false)}
                  <p>サーバーアドレス：<code class="card-tag tag-blue">{$sort14Node['address']}</code></p>
                  <p>ポート番号：<code class="card-tag tag-volcano">{$sort14Node['port']}</code></p>
                  <p>パスワード：<code class="card-tag tag-geekblue">{$sort14Node['passwd']}</code></p>
                  {if $sort14Node['host'] != $sort14Node['address']}
                      <p>HOST&PEER：<code class="card-tag tag-green">{$sort14Node['host']}</code></p>
                  {/if}
                </div>
              </div>
            </div>
          </div>
        </div>
        {elseif in_array("ssr",$malio_config['support_sub_type']) }
        <div class="tab-pane fade {if $node->mu_only != 1}active show{/if}" id="ssr" role="tabpanel" aria-labelledby="ssr-tab">
          <div class="row mt-2">
            {if URL::SSRCanConnect($user, $mu)}
            <div class="col-12 col-sm-3 col-md-3">
              <ul class="nav nav-pills flex-column" id="myTab4" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="ssr-info-tab" data-toggle="tab" href="#ssr-info" role="tab" aria-controls="ssr-info" aria-selected="true">設定情報</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="ssr-qrcode-tab" data-toggle="tab" href="#ssr-qrcode" role="tab" aria-controls="ssr-qrcode" aria-selected="false">QRコード</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="ssr-link-tab" data-toggle="tab" href="#ssr-link" role="tab" aria-controls="ssr-link" aria-selected="false">リンク</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="ssr-json-tab" data-toggle="tab" href="#ssr-json" role="tab" aria-controls="ssr-json" aria-selected="false">JSON形式</a>
                </li>
              </ul>
            </div>
            <div class="col-12 col-sm-9 col-md-9">
              <div class="tab-content no-padding" id="myTab2Content">
                <div class="tab-pane fade active show" id="ssr-info" role="tabpanel" aria-labelledby="ssr-info-tab">
                  {$ssr_item = URL::getItem($user, $node, $mu, $relay_rule_id, 0)}
                  {if $ssr_item['obfs']=="v2ray"}
                  <p>このサーバーを使用するには「サーバー設定」→「暗号化方式」から”AEAD”がつく項目に設定する必要があります。</p>
                  {else}
                  <p>サーバーアドレス：<code>{$ssr_item['address']}</code><br>
                    ポート番号：<code>{$ssr_item['port']}</code><br>
                    暗号化方式：<code>{$ssr_item['method']}</code><br>
                    パスワード：<code>{$ssr_item['passwd']}</code><br>
                    プロトコル：<code>{$ssr_item['protocol']}</code><br>
                    プロトコルパラメーター：<code>{$ssr_item['protocol_param']}</code><br>
                    OBFS：<code>{$ssr_item['obfs']}</code><br>
                    OBFSパラメーター：<code>{$ssr_item['obfs_param']}</code><br></p>
                  {/if}
                </div>
                <div class="tab-pane fade" id="ssr-qrcode" role="tabpanel" aria-labelledby="ssr-qrcode-tab">
                  {if $ssr_item['obfs']=="v2ray"}
                  <p>このサーバーを使用するには「サーバー設定」→「暗号化方式」から”AEAD”がつく項目に設定する必要があります。</p>
                  {else}
                  <div id="ssr-qrcode-img"></div>
                  {/if}
                </div>
                <div class="tab-pane fade" id="ssr-link" role="tabpanel" aria-labelledby="ssr-link-tab">
                  {if $ssr_item['obfs']=="v2ray"}
                  <p>このサーバーを使用するには「サーバー設定」→「暗号化方式」から”AEAD”がつく項目に設定する必要があります。</p>
                  {else}
                  <p><a href="##" class="copy-text" data-clipboard-text="{URL::getItemUrl($ssr_item, 0)}">設定URLをコピーする</a>
                  </p>
                  <p><a href="{URL::getItemUrl($ssr_item, 0)}">Safariから直接設定する(iOS専用)</a></p>
                  {/if}
                </div>
                <div class="tab-pane fade" id="ssr-json" role="tabpanel" aria-labelledby="ssr-json-tab">
                  {if $ssr_item['obfs']=="v2ray"}
                  <p>このサーバーを使用するには「サーバー設定」→「暗号化方式」から”AEAD”がつく項目に設定する必要があります。</p>
                  {else}
                  <pre style="color:#e83e8c">
{
  "server": "{$ssr_item['address']}",
  "local_address": "127.0.0.1",
  "local_port": 1080,
  "timeout": 300,
  "workers": 1,
  "server_port": {$ssr_item['port']},
  "password": "{$ssr_item['passwd']}",
  "method": "{$ssr_item['method']}",
  "obfs": "{$ssr_item['obfs']}",
  "obfs_param": "{$ssr_item['obfs_param']}",
  "protocol": "{$ssr_item['protocol']}",
  "protocol_param": "{$ssr_item['protocol_param']}"
}
</pre>
                  {/if}
                </div>
              </div>
            </div>
            {else}
            <p>現在の暗号化方式・プロトコル・OBFSの設定ではShadowsocksRクライアントでは接続できません。Shadowsocksタブをクリックしてください。</p>
            <p>また、ShadowsocksRの単一ポートサーバーは影響を受けませんので、単一ポートサーバーに限りそのままで接続できます。</p>
            {/if}
          </div>
        </div>
        <div class="tab-pane fade" id="ss" role="tabpanel" aria-labelledby="ss-tab">
          <div class="row mt-2">
            {if URL::SSCanConnect($user, $mu)}
            <div class="col-12 col-sm-3 col-md-3">
              <ul class="nav nav-pills flex-column" id="myTab4" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="ss-info-tab" data-toggle="tab" href="#ss-info" role="tab" aria-controls="ss-info" aria-selected="true">設定情報</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="ss-qrcode-tab" data-toggle="tab" href="#ss-qrcode" role="tab" aria-controls="ss-qrcode" aria-selected="false">QRコード</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="ss-link-tab" data-toggle="tab" href="#ss-link" role="tab" aria-controls="ss-link" aria-selected="false">リンク</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="ss-json-tab" data-toggle="tab" href="#ss-json" role="tab" aria-controls="ss-json" aria-selected="false">JSON形式</a>
                </li>
              </ul>
            </div>
            <div class="col-12 col-sm-9 col-md-9">
              <div class="tab-content no-padding" id="myTab2Content">
                <div class="tab-pane fade active show" id="ss-info" role="tabpanel" aria-labelledby="ss-info-tab">
                  {$ss_item = URL::getItem($user, $node, $mu, $relay_rule_id, 1)}
                  {if $ss_item['obfs']=="v2ray" && URL::CanMethodConnect($user->method)!=2}
                  <p>このサーバーを使用するには「サーバー設定」→「暗号化方式」から”AEAD”がつく項目に設定する必要があります。</p>
                  {else}
                  <p>サーバーアドレス：<code>{$ss_item['address']}</code><br>
                    ポート番号：<code>{$ss_item['port']}</code><br>
                    暗号化方式：<code>{$ss_item['method']}</code><br>
                    パスワード：<code>{$ss_item['passwd']}</code><br>
                    プロトコル：<code>{$ss_item['obfs']}</code><br>
                    プロトコルパラメーター：<code>{$ss_item['obfs_param']}</code><br>
                  </p>
                  {/if}
                </div>
                <div class="tab-pane fade" id="ss-qrcode" role="tabpanel" aria-labelledby="ss-qrcode-tab">
                  {if $ss_item['obfs']=="v2ray"}
                  <p>このサーバーを使用するには「サーバー設定」→「暗号化方式」から”AEAD”がつく項目に設定する必要があります。</p>
                  {else}
                  <div id="ss-qr-win"></div>
                  <p>Windows専用 👆</p>
                  <p>その他iOS・macOS・Android等👇</p>
                  <div id="ss-qr"></div>
                  {/if}
                </div>
                <div class="tab-pane fade" id="ss-link" role="tabpanel" aria-labelledby="ss-link-tab">
                  {if $ss_item['obfs']=="v2ray"}
                  <p>このサーバーを使用するには「サーバー設定」→「暗号化方式」から”AEAD”がつく項目に設定する必要があります。</p>
                  {else}
                  <p><a href="##" class="copy-text" data-clipboard-text="{URL::getItemUrl($ss_item, 1)}">設定URLをコピーする</a>
                  </p>
                  <p><a href="{URL::getItemUrl($ss_item, 1)}">Safariから直接設定する(iOS専用)</a>
                  </p>
                  {/if}
                </div>
                <div class="tab-pane fade" id="ss-json" role="tabpanel" aria-labelledby="ss-json-tab">
                  {if $ss_item['obfs']=="v2ray"}
                  <p>このサーバーを使用するには「サーバー設定」→「暗号化方式」から”AEAD”がつく項目に設定する必要があります。</p>
                  {else}
<pre style="color:#e83e8c">
  {
      "server": "{$ss_item['address']}",
      "local_address": "127.0.0.1",
      "local_port": 1080,
      "timeout": 300,
      "workers": 1,
      "server_port": {$ss_item['port']},
      "password": "{$ss_item['passwd']}",
      "method": "{$ss_item['method']}",
      "plugin": "{URL::getJsonObfs($ss_item)}"
  }
</pre>
                  {/if}
                </div>
              </div>
            </div>
            {else}
            <p>現在の暗号化方式・プロトコル・OBFSの設定ではShadowsocksクライアントでは接続できません。ShadowsocksRタブをクリックしてください。</p>
            {/if}
          </div>
        </div>
        {$first_mu_node = true}
        {foreach $nodes_muport as $single_muport}
          {if !($single_muport['server']->node_class <= $user->class && ($single_muport['server']->node_group == 0 || $single_muport['server']->node_group == $user->node_group))}
              {continue}
          {/if}

          {if !($single_muport['user']->class >= $node['class'] && ($node['group'] == 0 || $single_muport['user']->node_group == $node['group']))}
              {continue}
          {/if}
        
          <div class="tab-pane fade {if $node->mu_only == 1 and $first_mu_node == true}active show{$first_mu_node = false}{/if}" id="ssr-{$single_muport['server']->server}" role="tabpanel" aria-labelledby="ssr-{$single_muport['server']->server}-tab">
              <div class="row mt-2">
                {if URL::SSRCanConnect($user, $mu)}
                <div class="col-12 col-sm-3 col-md-3">
                  <ul class="nav nav-pills flex-column" id="myTab4" role="tablist">
                    <li class="nav-item">
                      <a class="nav-link active" id="ssr-{$single_muport['server']->server}-info-tab" data-toggle="tab" href="#ssr-{$single_muport['server']->server}-info" role="tab" aria-controls="ssr-{$single_muport['server']->server}-info" aria-selected="true">設定情報</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="ssr-{$single_muport['server']->server}-qrcode-tab" data-toggle="tab" href="#ssr-{$single_muport['server']->server}-qrcode" role="tab" aria-controls="ssr-{$single_muport['server']->server}-qrcode" aria-selected="false">QRコード</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="ssr-{$single_muport['server']->server}-link-tab" data-toggle="tab" href="#ssr-{$single_muport['server']->server}-link" role="tab" aria-controls="ssr-{$single_muport['server']->server}-link" aria-selected="false">リンク</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" id="ssr-{$single_muport['server']->server}-json-tab" data-toggle="tab" href="#ssr-{$single_muport['server']->server}-json" role="tab" aria-controls="ssr-{$single_muport['server']->server}-json" aria-selected="false">JSON形式</a>
                    </li>
                  </ul>
                </div>
                <div class="col-12 col-sm-9 col-md-9">
                  <div class="tab-content no-padding" id="myTab2Content">
                    <div class="tab-pane fade active show" id="ssr-{$single_muport['server']->server}-info" role="tabpanel" aria-labelledby="ssr-{$single_muport['server']->server}-info-tab">
                      {$ssr_item_mu_only = URL::getItem($user, $node, {$single_muport['server']->server}, $relay_rule_id, 0)}
                      {if $ssr_item_mu_only['obfs']=="v2ray"}
                      <p>このサーバーを使用するには「サーバー設定」→「暗号化方式」から”AEAD”がつく項目に設定する必要があります。</p>
                      {else}
                      <p>サーバーアドレス：<code>{$ssr_item_mu_only['address']}</code><br>
                        ポート番号：<code>{$ssr_item_mu_only['port']}</code><br>
                        暗号化方式：<code>{$ssr_item_mu_only['method']}</code><br>
                        パスワード：<code>{$ssr_item_mu_only['passwd']}</code><br>
                        プロトコル：<code>{$ssr_item_mu_only['protocol']}</code><br>
                        プロトコルパラメーター：<code>{$ssr_item_mu_only['protocol_param']}</code><br>
                        OBFS：<code>{$ssr_item_mu_only['obfs']}</code><br>
                        OBFSパラメーター：<code>{$ssr_item_mu_only['obfs_param']}</code><br></p>
                      {/if}
                    </div>
                    <div class="tab-pane fade" id="ssr-{$single_muport['server']->server}-qrcode" role="tabpanel" aria-labelledby="ssr-{$single_muport['server']->server}-qrcode-tab">
                      {if $ssr_item_mu_only['obfs']=="v2ray"}
                      <p>このサーバーを使用するには「サーバー設定」→「暗号化方式」から”AEAD”がつく項目に設定する必要があります。</p>
                      {else}
                      <div id="ssr-{$single_muport['server']->server}-qrcode-img"></div>
                      {/if}
                    </div>
                    <div class="tab-pane fade" id="ssr-{$single_muport['server']->server}-link" role="tabpanel" aria-labelledby="ssr-{$single_muport['server']->server}-link-tab">
                      {if $ssr_item_mu_only['obfs']=="v2ray"}
                      <p>このサーバーを使用するには「サーバー設定」→「暗号化方式」から”AEAD”がつく項目に設定する必要があります。</p>
                      {else}
                      <p><a href="##" class="copy-text" data-clipboard-text="{URL::getItemUrl($ssr_item_mu_only, 0)}">設定URLをコピーする</a>
                      </p>
                      <p><a href="{URL::getItemUrl($ssr_item_mu_only, 0)}">Safariから直接設定する(iOS専用)</a></p>
                      {/if}
                    </div>
                    <div class="tab-pane fade" id="ssr-{$single_muport['server']->server}-json" role="tabpanel" aria-labelledby="ssr-{$single_muport['server']->server}-json-tab">
                      {if $ssr_item_mu_only['obfs']=="v2ray"}
                      <p>このサーバーを使用するには「サーバー設定」→「暗号化方式」から”AEAD”がつく項目に設定する必要があります。</p>
                      {else}
                      <pre style="color:#e83e8c">
    {
      "server": "{$ssr_item_mu_only['address']}",
      "local_address": "127.0.0.1",
      "local_port": 1080,
      "timeout": 300,
      "workers": 1,
      "server_port": {$ssr_item_mu_only['port']},
      "password": "{$ssr_item_mu_only['passwd']}",
      "method": "{$ssr_item_mu_only['method']}",
      "obfs": "{$ssr_item_mu_only['obfs']}",
      "obfs_param": "{$ssr_item_mu_only['obfs_param']}",
      "protocol": "{$ssr_item_mu_only['protocol']}",
      "protocol_param": "{$ssr_item_mu_only['protocol_param']}"
    }
    </pre>
                      {/if}
                    </div>
                  </div>
                </div>
                {else}
                <p>現在の暗号化方式・プロトコル・OBFSの設定ではShadowsocksRクライアントでは接続できません。Shadowsocksタブをクリックしてください。</p>
                <p>また、ShadowsocksRの単一ポートサーバーは影響を受けませんので、単一ポートサーバーに限りそのままで接続できます。</p>
                {/if}
              </div>
            </div>
        {/foreach}
      </div>
      {/if}
    </div>
  </div>

  {include file='user/scripts.tpl'}

  <script src="https://cdn.jsdelivr.net/npm/kjua@0.1.2/dist/kjua.min.js"></script>

  <script>
    {if URL::SSCanConnect($user, $mu)}
    $('#ss-qr').html(
      kjua({
        text: '{URL::getItemUrl($ss_item, 1)}',
        render: 'image',
        size: 256
      })
    );
    $('#ss-qr-win').html(
      kjua({
        text: '{URL::getItemUrl($ss_item, 2)}',
        render: 'image',
        size: 256
      })
    );
    {/if}

    {if URL::SSRCanConnect($user, $mu)}
    $('#ssr-qrcode-img').html(
      kjua({
        text: '{URL::getItemUrl($ssr_item, 0)}',
        render: 'image',
        size: 256
      })
    );
    {/if}

    {foreach $nodes_muport as $single_muport}
      {if !($single_muport['server']->node_class <= $user->class && ($single_muport['server']->node_group == 0 || $single_muport['server']->node_group == $user->node_group))}
          {continue}
      {/if}

      {if !($single_muport['user']->class >= $node['class'] && ($node['group'] == 0 || $single_muport['user']->node_group == $node['group']))}
          {continue}
      {/if}

      {$ssr_item_mu_only = URL::getItem($user, $node, {$single_muport['server']->server}, $relay_rule_id, 0)}

      $('#ssr-{$single_muport['server']->server}-qrcode-img').html(
        kjua({
          text: '{URL::getItemUrl($ssr_item_mu_only, 0)}',
          render: 'image',
          size: 256
        })
      );
    {/foreach}
  </script>

</body>

</html>

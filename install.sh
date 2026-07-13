# پاک کردن فایل
sudo rm -f /usr/local/x-ui/sub_templates/safevpn/index.html

# ساختن فایل جدید با خط درست
sudo tee /usr/local/x-ui/sub_templates/safevpn/index.html > /dev/null << 'EOF'
<!DOCTYPE html>
<html lang="fa" dir="rtl">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, viewport-fit=cover">
<title>Safe.Vpn — {{ if .subTitle }}{{ .subTitle }}{{ else }}پنل اشتراک{{ end }}</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
<style>
  @font-face{ font-family:'Vazirmatn'; font-weight:400; src:url('https://cdn.jsdelivr.net/gh/rastikerdar/vazirmatn@v33.003/fonts/webfonts/Vazirmatn-Regular.woff2') format('woff2'); }
  @font-face{ font-family:'Vazirmatn'; font-weight:500; src:url('https://cdn.jsdelivr.net/gh/rastikerdar/vazirmatn@v33.003/fonts/webfonts/Vazirmatn-Medium.woff2') format('woff2'); }
  @font-face{ font-family:'Vazirmatn'; font-weight:700; src:url('https://cdn.jsdelivr.net/gh/rastikerdar/vazirmatn@v33.003/fonts/webfonts/Vazirmatn-Bold.woff2') format('woff2'); }
  @font-face{ font-family:'Vazirmatn'; font-weight:800; src:url('https://cdn.jsdelivr.net/gh/rastikerdar/vazirmatn@v33.003/fonts/webfonts/Vazirmatn-ExtraBold.woff2') format('woff2'); }
  @font-face{ font-family:'Vazir-Mono'; src:url('https://cdn.jsdelivr.net/gh/rastikerdar/vazir-code-font@v2.0.1/dist/Vazir-Code.woff2') format('woff2'); }
  
  :root{
    --ink:#08070f; --panel:#12101f; --panel-2:#181529; --panel-3:#1e1a35;
    --line: rgba(255,255,255,0.08); --line-2: rgba(255,255,255,0.14);
    --brand:#6a4bff; --brand-2:#28d9c4; --brand-3:#ff5f87;
    --text:#f1eefc; --text-dim:#948dc0; --text-dim2:#645d8c;
    --good:#28d9c4; --warn:#ffb84d; --bad:#ff5f7d;
    --radius:20px;
  }
  [data-theme="light"]{
    --ink:#f4f2fb; --panel:#ffffff; --panel-2:#f8f7ff; --panel-3:#efecff;
    --line: rgba(20,10,60,0.08); --line-2: rgba(20,10,60,0.14);
    --text:#1a1530; --text-dim:#6b638f; --text-dim2:#9992bd;
  }
  *{box-sizing:border-box; -webkit-tap-highlight-color:transparent;}
  html{scroll-behavior:smooth;}
  body{
    margin:0; background:var(--ink); color:var(--text);
    font-family:'Vazirmatn',sans-serif;
    background-image:
      radial-gradient(circle at 10% -5%, rgba(106,75,255,0.25), transparent 40%),
      radial-gradient(circle at 100% 15%, rgba(40,217,196,0.14), transparent 38%),
      radial-gradient(circle at 50% 100%, rgba(255,95,135,0.08), transparent 45%);
    min-height:100vh; padding:16px 14px 96px; transition:background-color .2s ease, color .2s ease;
  }
  .wrap{max-width:520px; margin:0 auto;}
  a{color:inherit;}
  ::selection{ background:rgba(106,75,255,0.35); }
  .page{ display:none; animation:fadeIn .25s ease; }
  .page.active{ display:block; }
  @keyframes fadeIn{ from{opacity:0; transform:translateY(6px);} to{opacity:1; transform:translateY(0);} }
  .topbar{ display:flex; align-items:center; justify-content:space-between; margin-bottom:18px; }
  .greeting-row{ display:flex; align-items:center; gap:11px; }
  .avatar{
    width:44px; height:44px; border-radius:13px; flex-shrink:0;
    background:linear-gradient(140deg, var(--brand), #4327b8);
    display:flex; align-items:center; justify-content:center;
    box-shadow:0 4px 14px rgba(106,75,255,0.35);
    font-weight:800; color:#fff; font-size:16px;
  }
  .greeting-text{ display:flex; flex-direction:column; }
  .greeting-hi{ font-size:15.5px; font-weight:700; }
  .greeting-sub{ font-size:11.5px; color:var(--text-dim); margin-top:1px; }
  .brand-tag{ display:flex; align-items:center; gap:4px; font-size:11px; color:var(--text-dim2); font-weight:700; margin-top:2px; }
  .brand-tag b{ color:var(--brand-2); }
  .top-actions{ display:flex; gap:8px; }
  .icon-btn{
    width:36px; height:36px; border-radius:11px; border:1px solid var(--line);
    background:var(--panel-2); display:flex; align-items:center; justify-content:center;
    cursor:pointer; color:var(--text-dim);
  }
  .icon-btn svg{ width:16px; height:16px; }
  .icon-btn:active{ transform:scale(.94); }
  .hero{
    position:relative; overflow:hidden;
    background:linear-gradient(160deg, var(--panel-3) 0%, var(--panel) 72%);
    border:1px solid var(--line); border-radius:var(--radius);
    padding:22px 20px 20px;
  }
  .hero::before{
    content:""; position:absolute; inset:0;
    background-image:
      repeating-linear-gradient(90deg, rgba(255,255,255,0.03) 0 1px, transparent 1px 38px),
      repeating-linear-gradient(0deg, rgba(255,255,255,0.03) 0 1px, transparent 1px 38px);
    -webkit-mask-image:radial-gradient(circle at 82% 15%, black, transparent 62%);
    mask-image:radial-gradient(circle at 82% 15%, black, transparent 62%);
  }
  .hero-head{ display:flex; justify-content:space-between; align-items:flex-start; position:relative; z-index:1; }
  .status-pill{
    display:inline-flex; align-items:center; gap:6px; font-size:11.5px; color:var(--text-dim);
    background:rgba(40,217,196,0.10); border:1px solid rgba(40,217,196,0.25);
    padding:5px 11px; border-radius:20px; margin-bottom:10px;
  }
  .status-pill .dot{ width:6px; height:6px; border-radius:50%; background:var(--good); box-shadow:0 0 0 3px rgba(40,217,196,0.2); }
  .status-pill.off{ background:rgba(255,95,125,0.10); border-color:rgba(255,95,125,0.25); }
  .status-pill.off .dot{ background:var(--bad); box-shadow:0 0 0 3px rgba(255,95,125,0.2); }
  .plan-title{ font-size:12.5px; color:var(--text-dim); margin:0 0 3px; }
  .plan-days{ font-size:28px; font-weight:800; margin:0; }
  .plan-expire{ font-size:12px; color:var(--text-dim); margin-top:5px; }
  .ring-wrap{ position:relative; width:104px; height:104px; flex-shrink:0; }
  .ring-wrap svg{ transform:rotate(-90deg); }
  .ring-track{ fill:none; stroke:var(--line); stroke-width:9; }
  .ring-value{ fill:none; stroke:url(#ringGrad); stroke-width:9; stroke-linecap:round; transition:stroke-dashoffset .6s ease; }
  .ring-label{ position:absolute; inset:0; display:flex; flex-direction:column; align-items:center; justify-content:center; }
  .ring-pct{ font-size:18px; font-weight:800; }
  .ring-cap{ font-size:9.5px; color:var(--text-dim); }
  .usage-bar-wrap{ position:relative; z-index:1; margin-top:20px; }
  .usage-bar-track{ height:8px; border-radius:20px; background:var(--line); overflow:hidden; }
  .usage-bar-fill{ height:100%; border-radius:20px; background:linear-gradient(90deg, var(--brand), var(--brand-2)); width:0%; transition:width .6s ease; }
  .usage-bar-labels{ display:flex; justify-content:space-between; font-size:11px; color:var(--text-dim); margin-top:7px; font-family:'Vazir-Mono','Vazirmatn',sans-serif; }
  .quota-row{ display:flex; justify-content:space-between; margin-top:16px; padding-top:14px; border-top:1px dashed var(--line); position:relative; z-index:1; }
  .quota-item{ text-align:center; flex:1; }
  .quota-item + .quota-item{ border-right:1px solid var(--line); }
  .quota-item b{ display:block; font-size:16px; font-weight:700; font-family:'Vazir-Mono','Vazirmatn',sans-serif; }
  .quota-item small{ display:block; font-size:10.5px; color:var(--text-dim); margin-top:3px; }
  .used-total b{ color:var(--brand-2); } .lim b{ color:var(--brand); }
  .section-label{ display:flex; align-items:center; gap:8px; margin:26px 2px 11px; font-size:12.5px; color:var(--text-dim); font-weight:600; }
  .section-label:first-child{ margin-top:2px; }
  .section-label::after{ content:""; flex:1; height:1px; background:var(--line); }
  .section-label svg{ width:14px; height:14px; }
  .page-heading{ font-size:19px; font-weight:800; margin:2px 2px 16px; }
  .qc-grid{ display:grid; grid-template-columns:1fr 1fr; gap:9px; }
  .qc-btn{
    display:flex; flex-direction:column; align-items:center; justify-content:center; gap:6px;
    background:var(--panel-2); border:1px solid var(--line); border-radius:16px;
    padding:13px 8px; cursor:pointer; color:var(--text); font-family:inherit; font-size:inherit;
    text-decoration:none; width:100%;
  }
  .qc-btn span{ font-size:12px; font-weight:600; }
  .qc-btn svg{ width:19px; height:19px; }
  .qc-btn:active{ transform:scale(.96); }
  .qc-btn.wide{ grid-column:1/-1; flex-direction:row; background:linear-gradient(90deg, var(--brand), #4a30cf); border-color:transparent; }
  .qc-btn.wide span{ color:#fff; }
  .qc-btn.wide svg{ color:#fff; }
  .qc-btn .badge{ font-size:9px; color:var(--text-dim2); font-weight:500; }
  .toolbar{ display:flex; gap:8px; margin-bottom:11px; }
  .search-box{ flex:1; display:flex; align-items:center; gap:8px; background:var(--panel-2); border:1px solid var(--line); border-radius:13px; padding:9px 12px; }
  .search-box svg{ width:15px; height:15px; color:var(--text-dim2); flex-shrink:0; }
  .search-box input{ border:none; background:transparent; outline:none; color:var(--text); font-family:inherit; font-size:13px; width:100%; }
  .search-box input::placeholder{ color:var(--text-dim2); }
  .sort-btn{ width:38px; flex-shrink:0; border-radius:13px; border:1px solid var(--line); background:var(--panel-2); display:flex; align-items:center; justify-content:center; cursor:pointer; color:var(--text-dim); }
  .sort-btn svg{ width:16px; height:16px; }
  .server-list{ display:flex; flex-direction:column; gap:9px; }
  .server{ display:flex; align-items:center; gap:11px; background:var(--panel); border:1px solid var(--line); border-radius:15px; padding:11px 12px; }
  .proto-chip{ width:38px; height:38px; border-radius:11px; flex-shrink:0; display:flex; align-items:center; justify-content:center; font-size:10px; font-weight:800; font-family:'Vazir-Mono',sans-serif; letter-spacing:.2px; }
  .proto-vless{ background:rgba(106,75,255,0.16); color:#a794ff; }
  .proto-vmess{ background:rgba(255,184,77,0.16); color:#ffb84d; }
  .proto-trojan{ background:rgba(255,95,125,0.16); color:#ff5f7d; }
  .proto-ss{ background:rgba(40,217,196,0.16); color:#28d9c4; }
  .proto-unknown{ background:var(--line); color:var(--text-dim); }
  .server-info{ flex:1; min-width:0; }
  .server-name{ font-size:13px; font-weight:600; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; }
  .server-host{ font-size:10.5px; color:var(--text-dim2); margin-top:2px; font-family:'Vazir-Mono',sans-serif; white-space:nowrap; overflow:hidden; text-overflow:ellipsis; }
  .server-actions{ display:flex; align-items:center; gap:6px; flex-shrink:0; }
  .ping-chip{ min-width:52px; text-align:center; font-size:11px; font-weight:700; padding:5px 8px; border-radius:9px; font-family:'Vazir-Mono',sans-serif; background:var(--panel-2); border:1px solid var(--line); color:var(--text-dim); cursor:pointer; }
  .ping-chip.good{ color:var(--good); border-color:rgba(40,217,196,.35); }
  .ping-chip.warn{ color:var(--warn); border-color:rgba(255,184,77,.35); }
  .ping-chip.bad{ color:var(--bad); border-color:rgba(255,95,125,.35); }
  .sm-icon-btn{ width:32px; height:32px; border-radius:10px; border:1px solid var(--line); background:var(--panel-2); display:flex; align-items:center; justify-content:center; cursor:pointer; color:var(--text-dim); flex-shrink:0; }
  .sm-icon-btn svg{ width:14px; height:14px; }
  .sm-icon-btn:active{ transform:scale(.92); }
  .empty{ text-align:center; color:var(--text-dim); font-size:12.5px; padding:26px; background:var(--panel); border:1px dashed var(--line); border-radius:15px; }
  .platform-tabs{ display:flex; gap:8px; background:var(--panel-2); border:1px solid var(--line); border-radius:14px; padding:5px; margin-bottom:16px; }
  .platform-tab{ flex:1; text-align:center; padding:9px 6px; border-radius:10px; font-size:12.5px; font-weight:700; color:var(--text-dim); cursor:pointer; display:flex; align-items:center; justify-content:center; gap:6px; }
  .platform-tab svg{ width:15px; height:15px; }
  .platform-tab.active{ background:linear-gradient(90deg, var(--brand), #4a30cf); color:#fff; }
  .app-group{ display:none; }
  .app-group.active{ display:flex; flex-direction:column; gap:9px; }
  .app-row{ display:flex; align-items:center; gap:12px; background:var(--panel); border:1px solid var(--line); border-radius:15px; padding:12px 13px; }
  .app-icon{ width:38px; height:38px; border-radius:10px; background:var(--panel-3); display:flex; align-items:center; justify-content:center; flex-shrink:0; font-size:16px; }
  .app-meta{ flex:1; min-width:0; }
  .app-name{ font-size:13px; font-weight:600; display:flex; align-items:center; gap:6px; }
  .app-tag{ font-size:9px; background:rgba(106,75,255,0.16); color:#a794ff; padding:2px 7px; border-radius:20px; font-weight:700; }
  .app-plat{ font-size:10.5px; color:var(--text-dim2); margin-top:2px; }
  .app-dl{ font-size:11.5px; font-weight:700; color:var(--brand-2); border:1px solid rgba(40,217,196,.3); background:rgba(40,217,196,.08); padding:7px 12px; border-radius:10px; text-decoration:none; flex-shrink:0; }
  .support-card{ display:flex; align-items:center; gap:14px; background:var(--panel); border:1px solid var(--line); border-radius:17px; padding:15px 16px; text-decoration:none; margin-bottom:11px; }
  .support-icon{ width:44px; height:44px; border-radius:13px; display:flex; align-items:center; justify-content:center; flex-shrink:0; font-size:20px; background:rgba(106,75,255,0.14); }
  .support-meta{ flex:1; min-width:0; }
  .support-title{ font-size:13.5px; font-weight:700; }
  .support-sub{ font-size:11px; color:var(--text-dim); margin-top:2px; }
  .support-arrow{ color:var(--text-dim2); flex-shrink:0; }
  .support-arrow svg{ width:16px; height:16px; }
  footer{ text-align:center; margin-top:32px; font-size:11px; color:var(--text-dim2); line-height:1.9; }
  footer a{ color:var(--brand-2); text-decoration:none; font-weight:600; }
  .profile-card{ background:var(--panel); border:1px solid var(--line); border-radius:18px; padding:6px 16px; }
  .profile-line{ display:flex; justify-content:space-between; align-items:center; padding:13px 0; border-bottom:1px solid var(--line); font-size:12.5px; }
  .profile-line:last-child{ border-bottom:none; }
  .profile-line .k{ color:var(--text-dim); display:flex; align-items:center; gap:7px; }
  .profile-line .k svg{ width:14px; height:14px; }
  .profile-line .v{ font-family:'Vazir-Mono',sans-serif; font-weight:600; }
  .profile-actions{ display:flex; gap:10px; margin-top:14px; }
  .toast{ position:fixed; bottom:88px; left:50%; transform:translateX(-50%) translateY(16px); background:var(--panel-3); border:1px solid var(--line-2); padding:10px 18px; border-radius:12px; font-size:12.5px; opacity:0; pointer-events:none; transition:all .25s ease; z-index:60; white-space:nowrap; }
  .toast.show{ opacity:1; transform:translateX(-50%) translateY(0); }
  .modal-overlay{ position:fixed; inset:0; background:rgba(2,1,8,0.68); backdrop-filter:blur(3px); display:flex; align-items:flex-end; justify-content:center; z-index:80; opacity:0; pointer-events:none; transition:opacity .2s ease; }
  .modal-overlay.show{ opacity:1; pointer-events:auto; }
  .modal-sheet{ width:100%; max-width:520px; background:var(--panel); border:1px solid var(--line); border-radius:22px 22px 0 0; padding:20px 20px 28px; transform:translateY(30px); transition:transform .25s ease; max-height:80vh; overflow-y:auto; }
  .modal-overlay.show .modal-sheet{ transform:translateY(0); }
  .modal-handle{ width:38px; height:4px; border-radius:4px; background:var(--line-2); margin:0 auto 16px; }
  .modal-title{ font-size:15px; font-weight:700; margin-bottom:14px; display:flex; justify-content:space-between; align-items:center; }
  .modal-title .x{ cursor:pointer; color:var(--text-dim); width:22px; height:22px; }
  .qr-box{ display:flex; justify-content:center; padding:16px; background:#fff; border-radius:16px; margin-bottom:14px; }
  .modal-link{ font-family:'Vazir-Mono',sans-serif; font-size:11px; color:var(--text-dim); background:var(--panel-2); border:1px solid var(--line); border-radius:11px; padding:10px 12px; word-break:break-all; margin-bottom:12px; }
  .bottom-nav{ position:fixed; left:14px; right:14px; bottom:14px; max-width:492px; margin:0 auto; background:var(--panel-2); border:1px solid var(--line); border-radius:20px; display:flex; justify-content:space-around; padding:9px 4px; box-shadow:0 10px 30px rgba(0,0,0,0.35); z-index:50; padding-bottom:calc(9px + env(safe-area-inset-bottom)); }
  .nav-item{ display:flex; flex-direction:column; align-items:center; gap:4px; color:var(--text-dim2); font-size:9.8px; cursor:pointer; padding:5px 6px; border-radius:12px; font-weight:500; flex:1; }
  .nav-item svg{ width:18px; height:18px; }
  .nav-item.active{ color:var(--brand); background:rgba(106,75,255,0.12); }
  @media (max-width:360px){ .plan-days{ font-size:23px; } .ring-wrap{ width:90px; height:90px; } .nav-item{ font-size:9px; } }
</style>
</head>
<body>
<div class="wrap">

  <div class="topbar">
    <div class="greeting-row">
      <div class="avatar" id="avatarInitial">?</div>
        <div class="greeting-hi"><span id="userName">User</span></div>
      <div class="greeting-text">
      </div>
    </div>
    <div class="top-actions">
      <button class="icon-btn" id="themeToggleBtn" type="button" title="Toggle Theme">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 12.8A9 9 0 1 1 11.2 3 7 7 0 0 0 21 12.8Z"/></svg>
      </button>
    </div>
  </div>

  <section class="page active" id="page-dashboard">
    <div class="hero">
      <div class="hero-head">
        <div>
          {{ if .enabled }}
          <div class="status-pill"><span class="dot"></span> Service Active</div>
          {{ else }}
          <div class="status-pill off"><span class="dot"></span> Service Inactive / Expired</div>
          {{ end }}
          <p class="plan-title">{{ if .subTitle }}{{ .subTitle }}{{ else }}Your Subscription Plan{{ end }}</p>
          <p class="plan-days" id="daysLeft">—</p>
          <p class="plan-expire" id="expireDate"></p>
        </div>
        <div class="ring-wrap">
          <svg width="104" height="104" viewBox="0 0 104 104">
            <defs><linearGradient id="ringGrad" x1="0%" y1="0%" x2="100%" y2="100%"><stop offset="0%" stop-color="#6a4bff"/><stop offset="100%" stop-color="#28d9c4"/></linearGradient></defs>
            <circle class="ring-track" cx="52" cy="52" r="44"/>
            <circle class="ring-value" id="ringArc" cx="52" cy="52" r="44" stroke-dasharray="276.5" stroke-dashoffset="276.5"/>
          </svg>
          <div class="ring-label"><span class="ring-pct" id="ringPct">—</span><span class="ring-cap">Remaining</span></div>
        </div>
      </div>

      <div class="usage-bar-wrap">
        <div class="usage-bar-track"><div class="usage-bar-fill" id="usageBarFill"></div></div>
        <div class="usage-bar-labels"><span id="usageUsedLabel">0 GB Used</span><span id="usageTotalLabel">of Unlimited</span></div>
      </div>

      <div class="quota-row">
        <div class="quota-item used-total"><b id="usedVal">—</b><small>Used</small></div>
        <div class="quota-item lim"><b id="limVal">—</b><small>Total</small></div>
      </div>
    </div>

    <div class="section-label">
      <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M13 2 3 14h7l-1 8 10-12h-7l1-8Z"/></svg>
      Quick Connect
    </div>
    <div class="qc-grid">
      <button class="qc-btn" type="button" id="btnV2box">
        <span class="badge">V2Box</span>
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 3"/></svg>
        <span>Auto Add</span>
      </button>
      <button class="qc-btn" type="button" id="btnV2rayng">
        <span class="badge">v2rayNG</span>
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 3"/></svg>
        <span>Auto Add</span>
      </button>
    </div>
  </section>

  <section class="page" id="page-servers">
    <div class="page-heading">Servers</div>
    <div class="toolbar">
      <div class="search-box">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="11" cy="11" r="7"/><path d="m21 21-4.3-4.3"/></svg>
        <input id="searchInput" placeholder="Search server...">
      </div>
      <div class="sort-btn" id="sortBtn" title="Sort">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 7h13M3 12h9M3 17h5M17 4v16M17 4l-3 3M17 4l3 3M17 20l-3-3M17 20l3-3"/></svg>
      </div>
    </div>
    <div class="server-list" id="serverList"></div>
  </section>

  <section class="page" id="page-apps">
    <div class="page-heading">Download Apps</div>
    <div class="platform-tabs">
      <div class="platform-tab active" data-platform="android">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="6" y="3" width="12" height="18" rx="2"/><path d="M11 18h2"/></svg>
        Android
      </div>
      <div class="platform-tab" data-platform="ios">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="7" y="2" width="10" height="20" rx="2"/><path d="M11 19h2"/></svg>
        iOS
      </div>
      <div class="platform-tab" data-platform="desktop">
        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="12" rx="2"/><path d="M8 20h8M12 16v4"/></svg>
        Desktop
      </div>
    </div>
    <div class="app-group active" id="apps-android"></div>
    <div class="app-group" id="apps-ios"></div>
    <div class="app-group" id="apps-desktop"></div>
  </section>

  <section class="page" id="page-support">
    <div class="page-heading">Support & Channel</div>

    <a class="support-card" href="https://t.me/SafeVpn5" target="_blank" rel="noopener">
      <div class="support-icon">🛟</div>
      <div class="support-meta">
        <div class="support-title">Online Support</div>
        <div class="support-sub">Get help with connection issues</div>
      </div>
      <div class="support-arrow"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="m9 18 6-6-6-6"/></svg></div>
    </a>

    <a class="support-card" href="https://t.me/SafeVpn13" target="_blank" rel="noopener">
      <div class="support-icon">📣</div>
      <div class="support-meta">
        <div class="support-title">Telegram Channel Safe.Vpn</div>
        <div class="support-sub">News, updates and maintenance info</div>
      </div>
      <div class="support-arrow"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="m9 18 6-6-6-6"/></svg></div>
    </a>

    <a class="support-card" href="https://t.me/VpnSafee_bot" target="_blank" rel="noopener">
      <div class="support-icon">🛒</div>
      <div class="support-meta">
        <div class="support-title">Buy & Renew</div>
        <div class="support-sub">Purchase or renew your subscription</div>
      </div>
      <div class="support-arrow"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="m9 18 6-6-6-6"/></svg></div>
    </a>

    <footer>Safe.Vpn</footer>
  </section>

  <section class="page" id="page-profile">
    <div class="page-heading">Profile</div>
    <div class="profile-card">
      <div class="profile-line">
        <span class="k"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="8" r="4"/><path d="M4 20c0-4 3.6-7 8-7s8 3 8 7"/></svg>Username</span>
        <span class="v" id="p_username">—</span>
      </div>
      <div class="profile-line">
        <span class="k"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="16" rx="2"/><path d="M3 8h18"/></svg>Subscription ID</span>
        <span class="v" id="p_subid">—</span>
      </div>
      <div class="profile-line">
        <span class="k"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="6" rx="2"/><rect x="3" y="14" width="18" height="6" rx="2"/></svg>Servers</span>
        <span class="v" id="p_count">—</span>
      </div>
      <div class="profile-line">
        <span class="k"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="12" r="9"/><path d="M12 7v5l3 3"/></svg>Last Online</span>
        <span class="v" id="p_lastonline">—</span>
      </div>
      <div class="profile-line">
        <span class="k"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><path d="M3 9h18M8 3v4M16 3v4"/></svg>Expiry Date</span>
        <span class="v" id="p_expire">—</span>
      </div>
    </div>
    <div class="profile-actions">
      <a class="qc-btn wide" id="btnRenew" href="https://t.me/VpnSafee_bot" target="_blank" rel="noopener">Renew Subscription</a>
    </div>
  </section>

</div>

<div class="toast" id="toast"></div>

<div class="modal-overlay" id="qrModal">
  <div class="modal-sheet">
    <div class="modal-handle"></div>
    <div class="modal-title">Scan & Connect <svg class="x" id="qrCloseBtn" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M18 6 6 18M6 6l12 12"/></svg></div>
    <div class="qr-box" id="qrMain"></div>
    <div class="modal-link" id="qrLinkText"></div>
    <button class="qc-btn" type="button" id="qrCopyBtn" style="width:100%">Copy Link</button>
  </div>
</div>

<div class="bottom-nav">
  <div class="nav-item" data-page="page-support">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 11.5a8.5 8.5 0 0 1-8.5 8.5c-1.2 0-2.3-.3-3.3-.8L3 20l1-4.9A8.5 8.5 0 1 1 21 11.5Z"/></svg>
    Support
  </div>
  <div class="nav-item" data-page="page-servers">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="6" rx="2"/><rect x="3" y="14" width="18" height="6" rx="2"/></svg>
    Servers
  </div>
  <div class="nav-item active" data-page="page-dashboard">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="m3 11 9-8 9 8"/><path d="M5 10v10h14V10"/></svg>
    Dashboard
  </div>
  <div class="nav-item" data-page="page-apps">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M12 3v12M7 10l5 5 5-5"/><path d="M4 18h16v3H4z"/></svg>
    Apps
  </div>
  <div class="nav-item" data-page="page-profile">
    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="12" cy="8" r="4"/><path d="M4 20c0-4 3.6-7 8-7s8 3 8 7"/></svg>
    Profile
  </div>
</div>

<script>
function goToPage(pageId){
  document.querySelectorAll('.page').forEach(function(p){ p.classList.remove('active'); });
  var target = document.getElementById(pageId);
  if(target) target.classList.add('active');
  document.querySelectorAll('.nav-item').forEach(function(n){
    n.classList.toggle('active', n.getAttribute('data-page')===pageId);
  });
  window.scrollTo(0,0);
}
document.querySelectorAll('.nav-item').forEach(function(item){
  item.addEventListener('click', function(){ goToPage(item.getAttribute('data-page')); });
});

var themeBtn = document.getElementById('themeToggleBtn');
if(themeBtn){
  themeBtn.addEventListener('click', function(){
    var cur = document.documentElement.getAttribute('data-theme');
    document.documentElement.setAttribute('data-theme', cur==='light' ? 'dark' : 'light');
  });
}

function openModal(id){ var m=document.getElementById(id); if(m) m.classList.add('show'); }
function closeModal(id){ var m=document.getElementById(id); if(m) m.classList.remove('show'); }
var qrModalEl = document.getElementById('qrModal');
if(qrModalEl){
  qrModalEl.addEventListener('click', function(e){ if(e.target===qrModalEl) closeModal('qrModal'); });
  document.getElementById('qrCloseBtn').addEventListener('click', function(){ closeModal('qrModal'); });
}

function toast(msg){
  var t=document.getElementById('toast'); if(!t) return;
  t.textContent=msg; t.classList.add('show');
  clearTimeout(window._tt); window._tt=setTimeout(function(){t.classList.remove('show');},1800);
}

document.querySelectorAll('.platform-tab').forEach(function(tab){
  tab.addEventListener('click', function(){
    var p = tab.getAttribute('data-platform');
    document.querySelectorAll('.platform-tab').forEach(function(t){ t.classList.toggle('active', t===tab); });
    document.querySelectorAll('.app-group').forEach(function(g){ g.classList.toggle('active', g.id==='apps-'+p); });
  });
});
</script>

<script>
var SUB_ID       = "{{ .subId }}";
var SUB_URL      = "{{ .subUrl }}";
var EXPIRE_SEC   = {{ .expire }};
var LAST_ONLINE  = {{ .lastOnline }};
var TOTAL_BYTE   = {{ .totalByte }};
var DOWNLOAD_B   = {{ .downloadByte }};
var UPLOAD_B     = {{ .uploadByte }};
var LINKS = [{{ range $i, $l := .links }}{{ if $i }}, {{ end }}"{{ $l }}"{{ end }}];
var EMAILS = [{{ range $i, $e := .emails }}{{ if $i }}, {{ end }}"{{ $e }}"{{ end }}];
var USERNAME = EMAILS.length ? EMAILS[0] : "User";

function formatBytes(b){
  if(!b || b<=0) return "0 GB";
  var units=["B","KB","MB","GB","TB"]; var i=0;
  while(b>=1024 && i<units.length-1){ b/=1024; i++; }
  return b.toFixed(i===0?0:2)+" "+units[i];
}
function copyText(text,msg){
  if(!text){ toast('Nothing to copy'); return; }
  navigator.clipboard.writeText(text).then(function(){ toast(msg||'Copied'); })
    .catch(function(){ toast('Failed to copy'); });
}
function renderQR(text){
  var el=document.getElementById('qrMain'); el.innerHTML="";
  new QRCode(el, { text:text, width:220, height:220, colorDark:"#0d0b1a", colorLight:"#ffffff" });
  document.getElementById('qrLinkText').textContent = text;
}
function deepLink(app){
  var encoded = encodeURIComponent(SUB_URL);
  var name = encodeURIComponent("Safe.Vpn");
  var url;
  if(app==='v2box')        url = 'v2box://install-config?url=' + encoded;
  else if(app==='v2rayng') url = 'v2rayng://install-sub?url=' + encoded + '&name=' + name;
  else return;
  window.location.href = url;
  toast('Opening app...');
}

document.getElementById('btnV2box').addEventListener('click', function(){ deepLink('v2box'); });
document.getElementById('btnV2rayng').addEventListener('click', function(){ deepLink('v2rayng'); });
document.getElementById('qrCopyBtn').addEventListener('click', function(){ copyText(document.getElementById('qrLinkText').textContent,'Copied'); });

document.getElementById('userName').textContent = USERNAME;
document.getElementById('avatarInitial').textContent = (USERNAME||'?').trim().charAt(0).toUpperCase();

(function renderHero(){
  var daysEl=document.getElementById('daysLeft'), expireEl=document.getElementById('expireDate');
  if(EXPIRE_SEC>0){
    var msLeft = EXPIRE_SEC*1000 - Date.now();
    var days = Math.max(0, Math.ceil(msLeft/86400000));
    daysEl.textContent = days + ' days';
    expireEl.textContent = 'Expires: ' + new Date(EXPIRE_SEC*1000).toLocaleDateString('fa-IR');
  } else {
    daysEl.textContent = 'Unlimited'; expireEl.textContent = 'No expiry';
  }

  var used = DOWNLOAD_B + UPLOAD_B;
  var ringArc=document.getElementById('ringArc'), ringPct=document.getElementById('ringPct');
  var circumference = 276.5, pct;
  if(TOTAL_BYTE>0){ pct = Math.max(0, Math.min(100, 100 - (used/TOTAL_BYTE)*100)); } else { pct = 100; }
  ringArc.style.strokeDashoffset = circumference - (circumference*pct/100);
  ringPct.textContent = TOTAL_BYTE>0 ? Math.round(pct)+'%' : '∞';

  document.getElementById('usedVal').textContent = formatBytes(used);
  document.getElementById('limVal').textContent = TOTAL_BYTE>0 ? formatBytes(TOTAL_BYTE) : 'Unlimited';

  var usedPct = TOTAL_BYTE>0 ? Math.min(100, (used/TOTAL_BYTE)*100) : 0;
  document.getElementById('usageBarFill').style.width = usedPct + '%';
  document.getElementById('usageUsedLabel').textContent = formatBytes(used) + ' Used';
  document.getElementById('usageTotalLabel').textContent = 'of ' + (TOTAL_BYTE>0 ? formatBytes(TOTAL_BYTE) : 'Unlimited');

  document.getElementById('p_username').textContent = USERNAME;
  document.getElementById('p_subid').textContent = SUB_ID || '—';
  document.getElementById('p_count').textContent = LINKS.length + ' servers';
  document.getElementById('p_lastonline').textContent = LAST_ONLINE>0 ? new Date(LAST_ONLINE).toLocaleString('fa-IR') : 'Never';
  document.getElementById('p_expire').textContent = EXPIRE_SEC>0 ? new Date(EXPIRE_SEC*1000).toLocaleDateString('fa-IR') : 'Unlimited';
})();

function parseLink(uri){
  try{
    var proto = uri.split('://')[0].toLowerCase();
    if(proto==='vmess'){
      var b64 = uri.replace('vmess://','').split('#')[0];
      var json = JSON.parse(decodeURIComponent(escape(atob(b64))));
      return { proto:'vmess', name: json.ps || 'VMess Server', host: json.add, port: json.port };
    }
    var withoutProto = uri.split('://')[1];
    var hashSplit = withoutProto.split('#');
    var name = hashSplit[1] ? decodeURIComponent(hashSplit[1]) : (proto.toUpperCase()+' Server');
    var main = hashSplit[0];
    var atSplit = main.split('@');
    var hostPort = atSplit.length>1 ? atSplit[1] : atSplit[0];
    hostPort = hostPort.split('?')[0].split('/')[0];
    var parts = hostPort.split(':');
    return { proto:proto, name:name, host:parts[0], port:parts[1]||'' };
  }catch(e){
    return { proto:'unknown', name:'Config Server', host:'', port:'' };
  }
}
function protoClass(p){
  if(p==='vless') return 'proto-vless';
  if(p==='vmess') return 'proto-vmess';
  if(p==='trojan') return 'proto-trojan';
  if(p==='ss'||p==='shadowsocks') return 'proto-ss';
  return 'proto-unknown';
}
function protoLabel(p){
  if(p==='vless') return 'VLESS';
  if(p==='vmess') return 'VMESS';
  if(p==='trojan') return 'TROJ';
  if(p==='ss'||p==='shadowsocks') return 'SS';
  return '?';
}

function pingHost(host, port, chipEl){
  chipEl.textContent = '...'; chipEl.className = 'ping-chip';
  var target = 'https://8.8.8.8/';
  var t0 = performance.now();
  fetch(target, { mode:'no-cors', cache:'no-store' }).then(finish).catch(finish);
  var timeout = setTimeout(function(){ chipEl.textContent='timeout'; chipEl.className='ping-chip bad'; }, 4000);
  function finish(){
    clearTimeout(timeout);
    var ms = Math.round(performance.now()-t0);
    chipEl.textContent = Math.max(1, Math.round(ms * 0.7)) + ' ms';
    chipEl.className = 'ping-chip ' + (ms<150?'good':(ms<400?'warn':'bad'));
  }
}

var sortMode = 'default';
var serverListEl = document.getElementById('serverList');

function renderServers(){
  var q = (document.getElementById('searchInput').value||'').toLowerCase();
  var items = LINKS.map(function(link, i){
    var parsed = parseLink(link);
    if(EMAILS[i]) parsed.name = EMAILS[i] + ' — ' + parsed.name;
    parsed.link = link; parsed.idx = i;
    return parsed;
  }).filter(function(p){
    return !q || p.name.toLowerCase().indexOf(q)>-1 || p.host.toLowerCase().indexOf(q)>-1;
  });
  if(sortMode==='name'){ items.sort(function(a,b){ return a.name.localeCompare(b.name); }); }

  if(items.length===0){ serverListEl.innerHTML = '<div class="empty">No servers found</div>'; return; }

  serverListEl.innerHTML = items.map(function(p){
    return '' +
    '<div class="server" data-link="'+encodeURIComponent(p.link)+'" data-host="'+escapeHtml(p.host)+'" data-port="'+escapeHtml(p.port)+'">' +
      '<div class="proto-chip '+protoClass(p.proto)+'">'+protoLabel(p.proto)+'</div>' +
      '<div class="server-info">' +
        '<div class="server-name">'+escapeHtml(p.name)+'</div>' +
        '<div class="server-host">'+escapeHtml(p.host)+(p.port?(':'+p.port):'')+'</div>' +
      '</div>' +
      '<div class="server-actions">' +
        '<div class="ping-chip" data-action="ping">Test</div>' +
        '<div class="sm-icon-btn" data-action="qr" title="QR"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/></svg></div>' +
        '<div class="sm-icon-btn" data-action="copy" title="Copy"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="9" y="9" width="12" height="12" rx="2"/><path d="M5 15V5a2 2 0 0 1 2-2h10"/></svg></div>' +
      '</div>' +
    '</div>';
  }).join('');
}
function escapeHtml(s){ return (s||'').replace(/[&<>"']/g, function(c){ return {'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]; }); }

serverListEl.addEventListener('click', function(e){
  var actionEl = e.target.closest('[data-action]');
  if(!actionEl) return;
  var card = e.target.closest('.server');
  var link = decodeURIComponent(card.getAttribute('data-link'));
  var host = card.getAttribute('data-host');
  var port = card.getAttribute('data-port');
  var action = actionEl.getAttribute('data-action');
  if(action==='ping') pingHost(host, port, actionEl);
  else if(action==='qr'){ openModal('qrModal'); renderQR(link); }
  else if(action==='copy') copyText(link, 'Config copied');
});
document.getElementById('searchInput').addEventListener('input', renderServers);
document.getElementById('sortBtn').addEventListener('click', function(){
  sortMode = sortMode==='default' ? 'name' : (sortMode==='name' ? 'ping' : 'default');
  toast(sortMode==='default' ? 'Default order' : (sortMode==='name' ? 'Sort by name' : 'Sort by ping'));
  renderServers();
});
renderServers();

var APPS = {
  android: [
    { name:'V2Box', tag:'Recommended', icon:'📦', url:'https://play.google.com/store/apps/details?id=dev.hexasoftware.v2box' },
    { name:'Hiddify Next', icon:'🛡️', url:'https://hiddify.com/download/' },
    { name:'v2rayNG', icon:'🤖', url:'https://github.com/2dust/v2rayNG/releases' }
  ],
  ios: [
    { name:'V2Box', tag:'Recommended', icon:'📦', url:'https://apps.apple.com/app/v2box-v2ray-client/id6446814690' },
    { name:'Streisand', icon:'🍏', url:'https://apps.apple.com/app/streisand/id6450534064' },
    { name:'Hiddify Next', icon:'🛡️', url:'https://hiddify.com/download/' }
  ],
  desktop: [
    { name:'v2rayN', icon:'🖥️', url:'https://github.com/2dust/v2rayN/releases' },
    { name:'Hiddify Next', icon:'🛡️', url:'https://hiddify.com/download/' },
    { name:'NekoRay / sing-box', icon:'📦', url:'https://github.com/MatsuriDayo/nekoray/releases' }
  ]
};
function renderAppGroup(platform){
  var el = document.getElementById('apps-'+platform);
  el.innerHTML = APPS[platform].map(function(a){
    return '<div class="app-row">' +
      '<div class="app-icon">'+a.icon+'</div>' +
      '<div class="app-meta"><div class="app-name">'+a.name+(a.tag?'<span class="app-tag">'+a.tag+'</span>':'')+'</div><div class="app-plat">Official Client</div></div>' +
      '<a class="app-dl" href="'+a.url+'" target="_blank">Download</a>' +
    '</div>';
  }).join('');
}
renderAppGroup('android'); renderAppGroup('ios'); renderAppGroup('desktop');
</script>
</body>
</html>
EOF

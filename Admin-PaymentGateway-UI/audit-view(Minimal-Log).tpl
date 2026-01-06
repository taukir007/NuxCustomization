{include file="sections/header.tpl"}

<style>
    /* ------------------------------------------------------------------
       THEME VARIABLES
       ------------------------------------------------------------------ */
    :root {
        --page-bg: #f8fafc;
        --card-bg: #ffffff;
        --border-color: #e2e8f0;
        
        --text-dark: #0f172a;
        --text-gray: #64748b;
        --text-light: #94a3b8;
        
        --brand-color: #6366f1;
        
        /* Status Colors */
        --st-success: #10b981; --st-success-bg: #d1fae5;
        --st-warning: #f59e0b; --st-warning-bg: #fef3c7;
        --st-danger: #ef4444;  --st-danger-bg: #fee2e2;
        --st-neutral: #64748b; --st-neutral-bg: #f1f5f9;
    }

    .dark-mode, .dark, [data-theme="dark"] {
        --page-bg: #0f172a;
        --card-bg: #1e293b;
        --border-color: #334155;
        --text-dark: #f8fafc;
        --text-gray: #cbd5e1;
        --text-light: #64748b;
        
        --st-success: #34d399; --st-success-bg: rgba(16, 185, 129, 0.2);
        --st-warning: #fbbf24; --st-warning-bg: rgba(245, 158, 11, 0.2);
        --st-danger: #f87171;  --st-danger-bg: rgba(239, 68, 68, 0.2);
    }

    /* ------------------------------------------------------------------
       LAYOUT
       ------------------------------------------------------------------ */
    .view-wrapper {
        background-color: var(--page-bg);
        min-height: 100vh;
        padding: 40px 20px;
        font-family: 'Inter', system-ui, sans-serif;
    }

    .view-container {
        max-width: 1100px;
        margin: 0 auto;
    }

    /* Header & Nav */
    .nav-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 25px;
    }

    .nav-title {
        font-size: 1.25rem;
        font-weight: 800;
        color: var(--text-dark);
        margin: 0;
    }

    .btn-back-outline {
        padding: 8px 16px;
        border: 1px solid var(--border-color);
        background: var(--card-bg);
        color: var(--text-gray);
        border-radius: 8px;
        font-weight: 600;
        font-size: 0.9rem;
        text-decoration: none !important;
        transition: all 0.2s;
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }
    .btn-back-outline:hover {
        border-color: var(--brand-color);
        color: var(--brand-color);
        transform: translateX(-2px);
    }

    /* ------------------------------------------------------------------
       HERO STATUS CARD
       ------------------------------------------------------------------ */
    .hero-card {
        background: var(--card-bg);
        border-radius: 16px;
        box-shadow: 0 4px 20px -5px rgba(0,0,0,0.05);
        padding: 30px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        flex-wrap: wrap;
        gap: 20px;
        margin-bottom: 30px;
        border: 1px solid var(--border-color);
        position: relative;
        overflow: hidden;
    }

    .hero-card::before {
        content: '';
        position: absolute;
        left: 0; top: 0; bottom: 0;
        width: 6px;
    }
    .hero-success::before { background: var(--st-success); }
    .hero-wait::before { background: var(--st-warning); }
    .hero-fail::before { background: var(--st-danger); }

    .hero-left {
        display: flex;
        align-items: center;
        gap: 20px;
    }

    .status-icon-box {
        width: 60px; height: 60px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 1.8rem;
    }
    .si-success { background: var(--st-success-bg); color: var(--st-success); }
    .si-wait { background: var(--st-warning-bg); color: var(--st-warning); }
    .si-fail { background: var(--st-danger-bg); color: var(--st-danger); }

    .hero-info h2 {
        margin: 0;
        font-size: 1.5rem;
        font-weight: 800;
        color: var(--text-dark);
    }
    .hero-info span {
        color: var(--text-gray);
        font-size: 0.9rem;
        font-family: monospace;
    }

    .hero-amount {
        text-align: right;
    }
    .amount-val {
        display: block;
        font-size: 2rem;
        font-weight: 800;
        color: var(--text-dark);
        letter-spacing: -1px;
    }
    .amount-lbl {
        color: var(--text-light);
        font-size: 0.85rem;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: 600;
    }

    /* ------------------------------------------------------------------
       DETAILS GRID
       ------------------------------------------------------------------ */
    .details-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
        gap: 25px;
        margin-bottom: 30px;
    }

    .info-card {
        background: var(--card-bg);
        border: 1px solid var(--border-color);
        border-radius: 12px;
        padding: 25px;
        display: flex;
        flex-direction: column;
        gap: 15px;
    }

    .card-label {
        color: var(--text-light);
        font-size: 0.75rem;
        text-transform: uppercase;
        letter-spacing: 1px;
        font-weight: 700;
        margin-bottom: 5px;
        display: flex;
        align-items: center;
        gap: 8px;
    }

    .info-row {
        display: flex;
        justify-content: space-between;
        align-items: center;
        border-bottom: 1px dashed var(--border-color);
        padding-bottom: 12px;
    }
    .info-row:last-child { border-bottom: none; padding-bottom: 0; }

    .k-label { color: var(--text-gray); font-size: 0.9rem; font-weight: 500; }
    .v-val { color: var(--text-dark); font-weight: 600; font-size: 0.95rem; text-align: right; }

    .link-styled { color: var(--brand-color); text-decoration: none; }
    .link-styled:hover { text-decoration: underline; }

    /* ------------------------------------------------------------------
       TERMINAL / LOGS SECTION (REDESIGNED)
       ------------------------------------------------------------------ */
    .log-section {
        margin-top: 40px;
    }
    
    .log-title {
        font-size: 1.1rem;
        font-weight: 700;
        color: var(--text-dark);
        margin-bottom: 15px;
        display: flex;
        align-items: center;
        gap: 10px;
    }

    /* Fixed Dark Theme for Terminal (Ignores page light/dark mode) */
    .terminal-window {
        background-color: #1e1e1e; /* Deep Dark Grey */
        color: #d4d4d4;
        font-family: 'Fira Code', 'Consolas', 'Courier New', monospace;
        border-radius: 8px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        border: 1px solid #333;
        overflow: hidden;
    }

    .terminal-header {
        background: #2d2d2d;
        padding: 12px 15px;
        display: flex;
        align-items: center;
        border-bottom: 1px solid #333;
        gap: 15px;
    }

    /* Mac Style Dots */
    .term-dots {
        display: flex;
        gap: 8px;
    }
    .term-dot {
        width: 12px; height: 12px;
        border-radius: 50%;
    }
    .dot-red { background: #ff5f56; }
    .dot-yellow { background: #ffbd2e; }
    .dot-green { background: #27c93f; }

    .term-heading {
        color: #858585;
        font-size: 0.8rem;
        font-weight: 600;
        letter-spacing: 0.5px;
        margin-left: 10px;
    }

    .terminal-body {
        padding: 25px;
        overflow-x: auto;
    }

    /* Log Lines */
    .cmd-block {
        margin-bottom: 25px;
    }
    
    .cmd-line {
        display: flex;
        align-items: flex-start;
        margin-bottom: 8px;
        line-height: 1.6;
    }

    .cmd-prompt {
        color: #10b981; /* Green Prompt */
        margin-right: 12px;
        user-select: none;
        font-weight: bold;
    }

    .cmd-command {
        color: #e5e5e5;
        font-weight: 600;
    }

    .json-output {
        display: table;
        margin-left: 20px;
        margin-top: 5px;
    }
    
    .json-row {
        display: table-row;
    }

    /* FORCED COLORS for Readability */
    .key-cell {
        display: table-cell;
        padding-right: 15px;
        color: #38bdf8; /* Bright Cyan for Keys */
        font-weight: bold;
        white-space: nowrap;
    }

    .val-cell {
        display: table-cell;
        color: #fb923c; /* Bright Orange for Values */
        word-break: break-all;
    }

    .comment {
        color: #6b7280;
        font-style: italic;
        margin-top: 15px;
        margin-bottom: 5px;
        display: block;
    }

    /* Mobile */
    @media (max-width: 768px) {
        .hero-card { flex-direction: column; text-align: center; }
        .hero-left { flex-direction: column; }
        .hero-amount { text-align: center; width: 100%; border-top: 1px solid var(--border-color); padding-top: 15px; }
        .details-grid { grid-template-columns: 1fr; }
    }

</style>

<div class="view-wrapper">
    <div class="view-container">
        
        <div class="nav-header">
            <h1 class="nav-title">Transaction Details</h1>
            <a href="{Text::url('paymentgateway/audit/')}{$pg['gateway']}" class="btn-back-outline">
                <i class="fa fa-arrow-left"></i> Back to History
            </a>
        </div>

        <div class="hero-card {if $pg['status'] == 2}hero-success{elseif $pg['status'] == 1}hero-wait{else}hero-fail{/if}">
            
            <div class="hero-left">
                <div class="status-icon-box {if $pg['status'] == 2}si-success{elseif $pg['status'] == 1}si-wait{else}si-fail{/if}">
                    {if $pg['status'] == 2}
                        <i class="fa fa-check"></i>
                    {elseif $pg['status'] == 1}
                        <i class="fa fa-clock-o"></i>
                    {else}
                        <i class="fa fa-times"></i>
                    {/if}
                </div>

                <div class="hero-info">
                    <h2>
                        {if $pg['status'] == 2}Payment Successful
                        {elseif $pg['status'] == 1}Payment Pending
                        {elseif $pg['status'] == 3}Payment Failed
                        {else}Payment Cancelled{/if}
                    </h2>
                    <span>TRX: {$pg['gateway_trx_id']}</span>
                </div>
            </div>

            <div class="hero-amount">
                <span class="amount-val">{Lang::moneyFormat($pg['price'])}</span>
                <span class="amount-lbl">Total Amount</span>
            </div>
        </div>

        <div class="details-grid">
            
            <div class="info-card">
                <div class="card-label"><i class="fa fa-user"></i> Customer Info</div>
                
                <div class="info-row">
                    <span class="k-label">Username</span>
                    <span class="v-val">
                        <a href="{Text::url('customers/viewu/')}{$pg['username']}" class="link-styled">{$pg['username']}</a>
                    </span>
                </div>
                <div class="info-row">
                    <span class="k-label">Plan</span>
                    <span class="v-val">{$pg['plan_name']}</span>
                </div>
                <div class="info-row">
                    <span class="k-label">Router</span>
                    <span class="v-val">{$pg['routers']}</span>
                </div>
            </div>

            <div class="info-card">
                <div class="card-label"><i class="fa fa-credit-card"></i> Payment Info</div>
                
                <div class="info-row">
                    <span class="k-label">Method</span>
                    <span class="v-val">{$pg['payment_method']}</span>
                </div>
                <div class="info-row">
                    <span class="k-label">Channel</span>
                    <span class="v-val">{$pg['payment_channel']}</span>
                </div>
                <div class="info-row">
                    <span class="k-label">Invoice</span>
                    <span class="v-val">
                        {if $pg['trx_invoice']}
                            <a href="{Text::url('reports/activation&q=')}{$pg['trx_invoice']}" class="link-styled">{$pg['trx_invoice']}</a>
                        {else}-{/if}
                    </span>
                </div>
                <div class="info-row">
                    <span class="k-label">Gateway Link</span>
                    <span class="v-val">
                        {if $pg['pg_url_payment']}
                            <a href="{$pg['pg_url_payment']}" target="_blank" class="link-styled"><i class="fa fa-external-link"></i> Open</a>
                        {else}-{/if}
                    </span>
                </div>
            </div>

            <div class="info-card">
                <div class="card-label"><i class="fa fa-calendar"></i> Timeline</div>
                
                <div class="info-row">
                    <span class="k-label">Created</span>
                    <span class="v-val">{if $pg['created_date']}{Lang::dateTimeFormat($pg['created_date'])}{else}-{/if}</span>
                </div>
                <div class="info-row">
                    <span class="k-label">Expired</span>
                    <span class="v-val">{if $pg['expired_date']}{Lang::dateTimeFormat($pg['expired_date'])}{else}-{/if}</span>
                </div>
                <div class="info-row">
                    <span class="k-label">Paid At</span>
                    <span class="v-val" style="color:var(--st-success);">
                        {if $pg['paid_date']}{Lang::dateTimeFormat($pg['paid_date'])}{else}-{/if}
                    </span>
                </div>
            </div>

        </div>

        <div class="log-section">
            <div class="log-title"><i class="fa fa-terminal"></i> Technical Logs</div>
            
            <div class="terminal-window">
                <div class="terminal-header">
                    <div class="term-dots">
                        <div class="term-dot dot-red"></div>
                        <div class="term-dot dot-yellow"></div>
                        <div class="term-dot dot-green"></div>
                    </div>
                    <div class="term-heading">root@server: ~/logs/api-transaction.log</div>
                </div>
                
                <div class="terminal-body">
                    
                    <div class="cmd-block">
                        <div class="cmd-line">
                            <span class="cmd-prompt">$</span>
                            <span class="cmd-command">cat request_payload.json</span>
                        </div>
                        {if $pg['pg_request']}
                            <div class="json-output">
                                {foreach $pg['pg_request'] as $k => $v}
                                    <div class="json-row">
                                        <span class="key-cell">"{$k}":</span>
                                        <span class="val-cell">"{$v}"</span>
                                    </div>
                                {/foreach}
                            </div>
                        {else}
                            <span class="comment">// No request data log available.</span>
                        {/if}
                    </div>

                    <div class="cmd-block">
                        <div class="cmd-line">
                            <span class="cmd-prompt">$</span>
                            <span class="cmd-command">tail -f response_callback.json</span>
                        </div>
                        {if $pg['pg_paid_response']}
                            <div class="json-output">
                                {foreach $pg['pg_paid_response'] as $k => $v}
                                    <div class="json-row">
                                        <span class="key-cell">"{$k}":</span>
                                        <span class="val-cell">"{$v}"</span>
                                    </div>
                                {/foreach}
                            </div>
                        {else}
                            <span class="comment">// Waiting for payment callback... (No data yet)</span>
                        {/if}
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>

{include file="sections/footer.tpl"}
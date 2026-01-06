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
       TERMINAL / LOGS SECTION
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

    .terminal-window {
        background-color: #1e1e1e; /* Dark theme forced */
        color: #d4d4d4;
        font-family: 'Fira Code', 'Consolas', 'Courier New', monospace;
        border-radius: 8px;
        box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        border: 1px solid #333;
        overflow: hidden;
        transition: all 0.3s cubic-bezier(0.25, 0.8, 0.25, 1);
        position: relative;
    }

    /* Terminal States */
    .terminal-window.minimized .terminal-body { display: none; }
    .terminal-window.fullscreen {
        position: fixed;
        top: 0; left: 0; right: 0; bottom: 0;
        width: 100vw; height: 100vh;
        z-index: 9999;
        border-radius: 0;
    }

    .terminal-header {
        background: #2d2d2d;
        padding: 12px 15px;
        display: flex;
        align-items: center;
        border-bottom: 1px solid #333;
        gap: 15px;
        user-select: none;
    }

    /* Traffic Lights */
    .term-dots { display: flex; gap: 8px; }
    .term-dot {
        width: 12px; height: 12px;
        border-radius: 50%;
        cursor: pointer;
        transition: transform 0.1s;
    }
    .term-dot:hover { transform: scale(1.1); filter: brightness(1.1); }
    .dot-red { background: #ff5f56; }    
    .dot-yellow { background: #ffbd2e; } 
    .dot-green { background: #27c93f; }  

    .term-heading {
        color: #858585;
        font-size: 0.8rem;
        font-weight: 600;
        letter-spacing: 0.5px;
        margin-left: 10px;
        flex-grow: 1;
        text-align: center;
        margin-right: 40px;
    }

    .terminal-body {
        padding: 25px;
        overflow-x: auto;
        min-height: 300px;
        font-size: 0.9rem;
    }
    .terminal-window.fullscreen .terminal-body {
        height: calc(100vh - 50px);
    }

    /* Log Elements */
    .cmd-block {
        margin-bottom: 25px;
        opacity: 0; 
        display: none;
    }
    .cmd-block.visible {
        opacity: 1;
        display: block;
    }
    
    .cmd-line {
        display: flex;
        align-items: flex-start;
        margin-bottom: 8px;
        line-height: 1.6;
    }

    .cmd-prompt {
        color: #10b981; 
        margin-right: 12px;
        user-select: none;
        font-weight: bold;
    }

    .cmd-command {
        color: #e5e5e5;
        font-weight: 600;
        min-height: 1.5em;
    }

    /* Blinking Cursor for Typing */
    .typing-cursor::after {
        content: '▋';
        color: #cbd5e1;
        animation: blink 1s step-end infinite;
        margin-left: 2px;
    }
    @keyframes blink { 0%, 100% { opacity: 1; } 50% { opacity: 0; } }

    /* JSON Data Tables */
    .json-output {
        display: none;
        width: 100%;
        border-collapse: collapse;
        margin-left: 20px;
        margin-top: 5px;
    }
    
    .json-row { 
        display: none; /* Rows hidden initially */
    }

    .key-cell {
        display: table-cell;
        padding-right: 15px;
        color: #38bdf8; /* Bright Cyan */
        font-weight: bold;
        white-space: nowrap;
    }

    .val-cell {
        display: table-cell;
        color: #fb923c; /* Bright Orange */
        word-break: break-all;
    }

    .comment {
        color: #6b7280;
        font-style: italic;
        margin-top: 15px;
        margin-bottom: 5px;
        display: none; 
    }

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
                    {if $pg['status'] == 2} <i class="fa fa-check"></i>
                    {elseif $pg['status'] == 1} <i class="fa fa-clock-o"></i>
                    {else} <i class="fa fa-times"></i> {/if}
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
                <div class="info-row"><span class="k-label">Username</span><span class="v-val"><a href="{Text::url('customers/viewu/')}{$pg['username']}" class="link-styled">{$pg['username']}</a></span></div>
                <div class="info-row"><span class="k-label">Plan</span><span class="v-val">{$pg['plan_name']}</span></div>
                <div class="info-row"><span class="k-label">Router</span><span class="v-val">{$pg['routers']}</span></div>
            </div>

            <div class="info-card">
                <div class="card-label"><i class="fa fa-credit-card"></i> Payment Info</div>
                <div class="info-row"><span class="k-label">Method</span><span class="v-val">{$pg['payment_method']}</span></div>
                <div class="info-row"><span class="k-label">Channel</span><span class="v-val">{$pg['payment_channel']}</span></div>
                <div class="info-row"><span class="k-label">Invoice</span><span class="v-val">{if $pg['trx_invoice']}<a href="{Text::url('reports/activation&q=')}{$pg['trx_invoice']}" class="link-styled">{$pg['trx_invoice']}</a>{else}-{/if}</span></div>
                <div class="info-row"><span class="k-label">Gateway Link</span><span class="v-val">{if $pg['pg_url_payment']}<a href="{$pg['pg_url_payment']}" target="_blank" class="link-styled"><i class="fa fa-external-link"></i> Open</a>{else}-{/if}</span></div>
            </div>

            <div class="info-card">
                <div class="card-label"><i class="fa fa-calendar"></i> Timeline</div>
                <div class="info-row"><span class="k-label">Created</span><span class="v-val">{if $pg['created_date']}{Lang::dateTimeFormat($pg['created_date'])}{else}-{/if}</span></div>
                <div class="info-row"><span class="k-label">Expired</span><span class="v-val">{if $pg['expired_date']}{Lang::dateTimeFormat($pg['expired_date'])}{else}-{/if}</span></div>
                <div class="info-row"><span class="k-label">Paid At</span><span class="v-val" style="color:var(--st-success);">{if $pg['paid_date']}{Lang::dateTimeFormat($pg['paid_date'])}{else}-{/if}</span></div>
            </div>

        </div>

        <div class="log-section" id="term-section">
            <div class="log-title"><i class="fa fa-terminal"></i> Technical Logs</div>
            
            <div class="terminal-window" id="term-window">
                <div class="terminal-header">
                    <div class="term-dots">
                        <div class="term-dot dot-red" onclick="termClose()" title="Close Terminal"></div>
                        <div class="term-dot dot-yellow" onclick="termMinimize()" title="Minimize"></div>
                        <div class="term-dot dot-green" onclick="termMaximize()" title="Fullscreen"></div>
                    </div>
                    <div class="term-heading">root@server: ~/logs/api-transaction.log</div>
                </div>
                
                <div class="terminal-body">
                    
                    <div class="cmd-block" id="block-1">
                        <div class="cmd-line">
                            <span class="cmd-prompt">$</span>
                            <span class="cmd-command typing-cursor" id="type-1"></span>
                        </div>
                        {if $pg['pg_request']}
                            <div class="json-output" id="out-1">
                                {foreach $pg['pg_request'] as $k => $v}
                                    <div class="json-row">
                                        <span class="key-cell">"{$k}":</span>
                                        <span class="val-cell">"{$v}"</span>
                                    </div>
                                {/foreach}
                            </div>
                        {else}
                            <span class="comment" id="msg-1">// No request data log available.</span>
                        {/if}
                    </div>

                    <div class="cmd-block" id="block-2">
                        <div class="cmd-line">
                            <span class="cmd-prompt">$</span>
                            <span class="cmd-command typing-cursor" id="type-2"></span>
                        </div>
                        {if $pg['pg_paid_response']}
                            <div class="json-output" id="out-2">
                                {foreach $pg['pg_paid_response'] as $k => $v}
                                    <div class="json-row">
                                        <span class="key-cell">"{$k}":</span>
                                        <span class="val-cell">"{$v}"</span>
                                    </div>
                                {/foreach}
                            </div>
                        {else}
                            <span class="comment" id="msg-2">// Waiting for callback... (No data or Failed)</span>
                        {/if}
                    </div>

                </div>
            </div>
        </div>

    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        // --- SETTINGS ---
        const cmd1Text = "cat request_payload.json";
        const cmd2Text = "tail -f response_callback.json";
        const cmdSpeed = 40;  // Command Typing Speed
        const jsonSpeed = 8;  // JSON Typing Speed (Fast)
        const delayBetween = 600; 

        // --- TYPING HELPERS ---
        
        // 1. Type Command Line (Simple Text)
        function typeCommand(element, text, callback) {
            let i = 0;
            element.innerHTML = '';
            function type() {
                if (i < text.length) {
                    element.innerHTML += text.charAt(i);
                    i++;
                    setTimeout(type, cmdSpeed);
                } else {
                    element.classList.remove('typing-cursor');
                    if (callback) callback();
                }
            }
            type();
        }

        // 2. Type JSON Row (Complex Structure)
        // We type Key, then Value, then show the row.
        async function typeJsonBlock(containerId, msgId, callback) {
            const container = document.getElementById(containerId);
            const msg = document.getElementById(msgId);

            // Handle Empty State (Comment)
            if (msg) {
                msg.style.display = 'block';
                await typeTextContent(msg, msg.textContent, cmdSpeed);
                if (callback) callback();
                return;
            }

            // Handle JSON Data
            if (container) {
                container.style.display = 'table';
                const rows = container.querySelectorAll('.json-row');
                
                for (let row of rows) {
                    row.style.display = 'table-row';
                    const keyCell = row.querySelector('.key-cell');
                    const valCell = row.querySelector('.val-cell');

                    if(keyCell && valCell) {
                        const kText = keyCell.textContent;
                        const vText = valCell.textContent;
                        
                        // Clear content to type it
                        keyCell.textContent = '';
                        valCell.textContent = '';
                        
                        // Type Key
                        await typeTextContent(keyCell, kText, jsonSpeed);
                        // Type Value
                        await typeTextContent(valCell, vText, jsonSpeed);
                    }
                }
                if (callback) callback();
            } else {
                if (callback) callback();
            }
        }

        // Generic Text Typer (Returns Promise)
        function typeTextContent(element, text, speed) {
            return new Promise(resolve => {
                let i = 0;
                element.textContent = ''; 
                function type() {
                    if (i < text.length) {
                        element.textContent += text.charAt(i);
                        i++;
                        setTimeout(type, speed);
                    } else {
                        resolve();
                    }
                }
                type();
            });
        }

        // --- SEQUENCE EXECUTION ---
        const b1 = document.getElementById('block-1');
        const t1 = document.getElementById('type-1');

        const b2 = document.getElementById('block-2');
        const t2 = document.getElementById('type-2');

        // Start Sequence
        setTimeout(() => {
            // 1. Show Block 1
            b1.classList.add('visible');
            
            // 2. Type Command "cat ..."
            typeCommand(t1, cmd1Text, function() {
                
                // 3. Type JSON Output 1
                typeJsonBlock('out-1', 'msg-1').then(() => {
                    
                    // 4. Wait & Show Block 2
                    setTimeout(() => {
                        b2.classList.add('visible');
                        
                        // 5. Type Command "tail ..."
                        typeCommand(t2, cmd2Text, function() {
                            
                            // 6. Type JSON Output 2
                            typeJsonBlock('out-2', 'msg-2');
                        });
                    }, delayBetween);
                });
            });
        }, 500);
    });

    // --- WINDOW CONTROLS ---
    function termClose() {
        document.getElementById('term-section').style.display = 'none';
    }

    function termMinimize() {
        document.getElementById('term-window').classList.toggle('minimized');
    }

    function termMaximize() {
        document.getElementById('term-window').classList.toggle('fullscreen');
    }
</script>

{include file="sections/footer.tpl"}
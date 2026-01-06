{include file="sections/header.tpl"}

<style>
    /* THEME VARIABLES - Dark/Light Mode Support */
    :root {
        --body-bg: #f8f9fa;          /* cool soft background */
        --card-bg: #ffffff;
        --card-border: #cbd5e1;      /* clearer but gentle border */
        --text-primary: #0f172a;     /* strong contrast */
        --text-secondary: #64748b;   /* blue-gray tone */
        --logo-area-bg: #e2e8f0;     /* subtle header separation */
        --accent-primary: #3b82f6;   /* blue-500 */
        --accent-hover: #2563eb;
        --danger: #ef4444;
        --success: #22c55e;
    }


    .dark-mode, .dark, [data-theme="dark"] {
        --body-bg: #0f172a;
        --card-bg: #1e293b;
        --card-border: #334155;
        --text-primary: #f8fafc;
        --text-secondary: #94a3b8;
        --logo-area-bg: #0f172a;
    }

    /* Layout Wrapper */
    .pg-wrapper {
        background-color: var(--body-bg);
        min-height: 100vh;
        padding: 40px 20px;
        font-family: 'Inter', system-ui, -apple-system, sans-serif;
    }

    .pg-header {
        max-width: 1200px;
        margin: 0 auto 50px;
        text-align: center;
        border-bottom: 1px solid var(--card-border);
    }

    .pg-title {
        font-size: 2.2rem;
        font-weight: 800;
        color: var(--text-primary);
        margin-bottom: 12px;
        letter-spacing: -0.02em;
    }

    .pg-subtitle {
        color: var(--text-secondary);
        font-size: 1.1rem;
        max-width: 600px;
        margin: 0 auto;
        line-height: 1.6;
        padding-bottom: 30px;
        
    }

    /* GRID SYSTEM */
    .pg-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
        gap: 30px;
        max-width: 1200px;
        margin: 0 auto;
    }

    /* CARD DESIGN */
    .pg-card {
        background: var(--card-bg);
        border: 1px solid var(--card-border);
        border-radius: 24px;
        overflow: visible; /* Changed to visible so the circle can float */
        transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        position: relative;
        display: flex;
        flex-direction: column;
        margin-top: 30px; /* Space for floating logo */
    }

    .pg-card:hover {
        transform: translateY(-8px);
        box-shadow: 0 20px 40px -5px rgba(0, 0, 0, 0.1);
        border-color: var(--accent-primary);
    }

    /* Logo Section (Top Half) */
    .pg-logo-area {
        height: 100px;
        background: var(--logo-area-bg);
        border-radius: 24px 24px 0 0; /* Manually rounding top corners */
        position: relative;
        margin-bottom: 45px; /* Space for the floating circle */
    }

    /* CIRCULAR LOGO BADGE */
    .pg-logo-circle {
        width: 80px;
        height: 80px;
        background: #ffffff;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        box-shadow: 0 8px 20px rgba(0,0,0,0.08);
        position: absolute;
        bottom: -40px; /* Floats half out */
        left: 50%;
        transform: translateX(-50%);
        border: 4px solid var(--card-bg);
        overflow: hidden;
        z-index: 5;
    }

    .pg-logo-img {
        width: 100%;
        height: 100%;
        object-fit: contain; /* Ensures logo fits nicely */
        padding: 12px; /* Inner padding so logo doesn't touch edges */
        background: #fff;
    }

    /* Toggle Switch (Positioned Absolute Top Right) */
    .pg-toggle-pos {
        position: absolute;
        top: 15px;
        right: 15px;
        z-index: 10;
    }
    
    .ios-toggle {
        position: relative;
        display: inline-block;
        width: 44px;
        height: 24px;
    }
    .ios-toggle input { opacity: 0; width: 0; height: 0; }
    .slider {
        position: absolute;
        cursor: pointer;
        top: 0; left: 0; right: 0; bottom: 0;
        background-color: #cbd5e1;
        transition: .4s;
        border-radius: 34px;
    }
    .slider:before {
        position: absolute;
        content: "";
        height: 20px;
        width: 20px;
        left: 2px;
        bottom: 2px;
        background-color: white;
        transition: .4s;
        border-radius: 50%;
        box-shadow: 0 2px 4px rgba(0,0,0,0.2);
    }
    input:checked + .slider { background-color: var(--success); }
    input:checked + .slider:before { transform: translateX(20px); }

    /* Content Section (Bottom Half) */
    .pg-content {
        padding: 0 24px 24px 24px;
        flex-grow: 1;
        display: flex;
        flex-direction: column;
        text-align: center;
    }

    .pg-name {
        font-size: 1.25rem;
        font-weight: 800;
        color: var(--text-primary);
        margin-bottom: 8px;
        text-transform: capitalize;
    }

    .pg-status-badge {
        font-size: 0.85rem;
        font-weight: 600;
        display: inline-block;
        margin-bottom: 25px;
    }
    .status-on { color: var(--success); }
    .status-off { color: var(--text-secondary); }

    /* Action Buttons */
    .pg-actions {
        margin-top: auto;
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        gap: 12px;
    }

    .btn-icon {
        background: transparent;
        border: 1px solid var(--card-border);
        color: var(--text-secondary);
        border-radius: 12px;
        height: 42px;
        display: flex;
        align-items: center;
        justify-content: center;
        text-decoration: none !important;
        transition: all 0.2s;
    }

    .btn-icon:hover {
        border-color: var(--accent-primary);
        color: var(--accent-primary);
        background: rgba(99, 102, 241, 0.05);
        transform: translateY(-2px);
    }

    .btn-del:hover {
        border-color: var(--danger);
        color: var(--danger);
        background: rgba(239, 68, 68, 0.05);
    }

    /* Save Button Section */
    .pg-footer {
        max-width: 1200px;
        margin: 50px auto 0;
        padding-top: 30px;
        border-top: 1px solid var(--card-border);
        text-align: right;
    }

    .btn-save-static {
        background: var(--text-primary);
        color: var(--card-bg);
        padding: 16px 48px;
        border-radius: 50px;
        font-weight: 700;
        border: none;
        font-size: 1.1rem;
        cursor: pointer;
        transition: transform 0.2s;
        box-shadow: 0 10px 20px rgba(0,0,0,0.1);
        text-transform: uppercase;
        letter-spacing: 0.5px;
    }

    .btn-save-static:hover {
        background: var(--accent-primary);
        color: white;
        transform: translateY(-4px);
        box-shadow: 0 15px 30px rgba(99, 102, 241, 0.3);
    }

</style>

<form method="post">
    <div class="pg-wrapper">
        
        <div class="pg-header">
            <h1 class="pg-title">{Lang::T('Payment Gateways')}</h1>
            <p class="pg-subtitle">Configure your automated payment processors. Enable the gateways you want to accept and manage their settings.</p>
        </div>

        <div class="pg-grid">
            {foreach $pgs as $pg}
                {* PATH LOGIC: Using root-relative path to avoid router issues *}
                {assign var="img_path" value="/ui/ui_custom/admin/paymentgateway/"}
                
                {if $pg == 'bkash'}
                    {assign var="logo_src" value="{$img_path}bkash-logo.png"}
                {elseif $pg == 'nagad'}
                    {assign var="logo_src" value="{$img_path}nagad-logo.png"}
                {else}
                    {assign var="logo_src" value="{$img_path}pg-logo.png"}
                {/if}

                <div class="pg-card">
                    <div class="pg-logo-area">
                        <div class="pg-toggle-pos">
                            <label class="ios-toggle">
                                <input type="checkbox" name="pgs[]" value="{$pg}" {if in_array($pg, $actives)}checked{/if}>
                                <span class="slider"></span>
                            </label>
                        </div>
                        
                        <div class="pg-logo-circle">
                            <img src="{$logo_src}" 
                                 alt="{$pg}" 
                                 class="pg-logo-img" 
                                 onerror="this.onerror=null;this.src='{$img_path}pg-logo.png';">
                        </div>
                    </div>

                    <div class="pg-content">
                        <div class="pg-name">{ucwords($pg)}</div>
                        <div class="pg-status-badge {if in_array($pg, $actives)}status-on{else}status-off{/if}">
                            {if in_array($pg, $actives)}
                                <i class="fa fa-circle" style="font-size:8px; vertical-align:middle;"></i> Active
                            {else}
                                <i class="fa fa-circle-o" style="font-size:8px; vertical-align:middle;"></i> Inactive
                            {/if}
                        </div>

                        <div class="pg-actions">
                            <a href="{Text::url('paymentgateway/')}{$pg}" class="btn-icon" title="Configure">
                                <i class="fa fa-sliders"></i>
                            </a>
                            <a href="{Text::url('paymentgateway/audit/')}{$pg}" class="btn-icon" title="View Transactions">
                                <i class="fa fa-file-text-o"></i>
                            </a>
                            <a href="{Text::url('paymentgateway/delete/')}{$pg}" 
                               onclick="return ask(this, '{Lang::T('Delete')} {$pg}?')" 
                               class="btn-icon btn-del" title="Delete">
                                <i class="fa fa-trash-o"></i>
                            </a>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>

        <div class="pg-footer">
            <button type="submit" class="btn-save-static" name="save" value="actives">
                <i class="fa fa-check"></i> {Lang::T('Save Changes')}
            </button>
        </div>

    </div>
</form>

{include file="sections/footer.tpl"}
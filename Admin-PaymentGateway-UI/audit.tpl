{include file="sections/header.tpl"}

<style>
    /* ------------------------------------------------------------------
       THEME VARIABLES - "Soft & Airy"
       ------------------------------------------------------------------ */
    :root {
        --page-bg: #f8fafc;
        --card-bg: #ffffff;
        --card-shadow: 0 10px 40px -10px rgba(0,0,0,0.08);
        --border-color: #e2e8f0;
        
        --text-main: #334155;
        --text-light: #94a3b8;
        
        /* Brand Gradient */
        --brand-gradient: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
        --brand-color: #6366f1;
        
        /* Status Colors */
        --st-success-bg: #dcfce7; --st-success-txt: #166534;
        --st-wait-bg: #fef9c3;    --st-wait-txt: #854d0e;
        --st-fail-bg: #fee2e2;    --st-fail-txt: #991b1b;
        --st-gray-bg: #f1f5f9;    --st-gray-txt: #475569;
        --st-cancel-bg: #fef3c7;  --st-cancel-txt: #92400e;

        /* Inputs */
        --input-bg: #f8fafc;
        --input-border: #e2e8f0;
        --input-focus: #6366f1;
    }

    .dark-mode, .dark, [data-theme="dark"] {
        --page-bg: #0f172a;
        --card-bg: #1e293b;
        --card-shadow: 0 10px 40px -10px rgba(0,0,0,0.5);
        --border-color: #334155;
        --text-main: #f1f5f9;
        --text-light: #94a3b8;
        --input-bg: #1e293b;
        --input-border: #475569;
        
        --st-success-bg: rgba(22, 101, 52, 0.2); --st-success-txt: #4ade80;
        --st-wait-bg: rgba(133, 77, 14, 0.2);    --st-wait-txt: #fde047;
        --st-fail-bg: rgba(153, 27, 27, 0.2);    --st-fail-txt: #f87171;
        --st-gray-bg: rgba(71, 85, 105, 0.2);    --st-gray-txt: #94a3b8;
        --st-cancel-bg: rgba(146, 64, 14, 0.25); --st-cancel-txt: #fbbf24;
    }

    /* ------------------------------------------------------------------
       LAYOUT
       ------------------------------------------------------------------ */
    .app-wrapper {
        background-color: var(--page-bg);
        min-height: 100vh;
        padding: 40px 20px;
        font-family: 'Inter', sans-serif;
    }

    .app-container {
        max-width: 1300px;
        margin: 0 auto;
    }

    /* Header */
    .top-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 30px;
        flex-wrap: wrap;
        gap: 20px;
    }

    .page-heading {
        margin: 0;
        font-size: 1.75rem;
        font-weight: 800;
        color: var(--text-main);
        letter-spacing: -0.5px;
    }

    .sub-heading {
        color: var(--text-light);
        font-size: 0.95rem;
        margin-top: 5px;
        font-weight: 500;
    }

    .btn-nav-back {
        background: transparent;
        color: var(--text-main);
        border: 2px solid var(--border-color);
        padding: 10px 24px;
        border-radius: 12px;
        font-weight: 700;
        font-size: 0.9rem;
        text-decoration: none !important;
        transition: all 0.2s ease;
    }
    .btn-nav-back:hover {
        border-color: var(--brand-color);
        color: var(--brand-color);
        background: rgba(99, 102, 241, 0.05);
    }

    /* ------------------------------------------------------------------
       MAIN CARD
       ------------------------------------------------------------------ */
    .data-card {
        background: var(--card-bg);
        border-radius: 20px;
        box-shadow: var(--card-shadow);
        overflow: hidden;
        position: relative;
    }

    /* Gradient Top Bar */
    .data-card::before {
        content: '';
        position: absolute;
        top: 0; left: 0; right: 0;
        height: 6px;
        background: var(--brand-gradient);
    }

    /* Toolbar Area */
    .card-toolbar {
        padding: 25px 30px;
        border-bottom: 1px solid var(--border-color);
        display: flex;
        justify-content: space-between;
        align-items: center;
        flex-wrap: wrap;
        gap: 20px;
    }

    /* Modern Search Input */
    .search-box {
        position: relative;
        width: 100%;
        max-width: 350px;
    }
    .search-box input {
        width: 100%;
        padding: 12px 20px 12px 48px;
        border-radius: 50px;
        border: 1px solid var(--input-border);
        background: var(--input-bg);
        color: var(--text-main);
        font-size: 0.9rem;
        transition: all 0.2s;
        outline: none;
    }
    .search-box input:focus {
        background: var(--card-bg);
        border-color: var(--input-focus);
        box-shadow: 0 0 0 4px rgba(99, 102, 241, 0.1);
    }
    .search-box i {
        position: absolute;
        left: 18px;
        top: 50%;
        transform: translateY(-50%);
        color: var(--text-light);
        pointer-events: none;
    }

    /* Limit Dropdown */
    .limit-wrapper {
        display: flex;
        align-items: center;
        gap: 10px;
        background: var(--input-bg);
        padding: 6px 12px;
        border-radius: 12px;
        border: 1px solid var(--input-border);
    }
    .limit-label {
        font-size: 0.85rem;
        color: var(--text-light);
        font-weight: 600;
    }
    .limit-select {
        border: none;
        background: transparent;
        font-weight: 700;
        color: var(--text-main);
        cursor: pointer;
        outline: none;
        padding-right: 5px;
    }

    /* ------------------------------------------------------------------
       TABLE DESIGN
       ------------------------------------------------------------------ */
    .table-responsive {
        width: 100%;
        overflow-x: auto;
    }

    .airy-table {
        width: 100%;
        border-collapse: separate;
        border-spacing: 0; /* Important for borders */
        white-space: nowrap;
    }

    .airy-table th {
        text-align: left;
        padding: 20px 30px;
        font-size: 0.75rem;
        text-transform: uppercase;
        letter-spacing: 0.08em;
        color: var(--text-light);
        font-weight: 700;
        border-bottom: 1px solid var(--border-color);
        background: var(--card-bg);
    }

    .airy-table td {
        padding: 20px 30px;
        border-bottom: 1px solid var(--border-color);
        color: var(--text-main);
        font-size: 0.95rem;
        vertical-align: middle;
        background: var(--card-bg);
        transition: background 0.2s;
    }

    /* Hover Effect */
    .airy-table tbody tr:hover td {
        background: rgba(99, 102, 241, 0.02);
    }

    /* Styling Elements */
    .trx-id {
        font-family: 'Courier New', monospace;
        font-weight: 600;
        background: var(--input-bg);
        padding: 4px 8px;
        border-radius: 6px;
        font-size: 0.85rem;
        color: var(--brand-color);
        text-decoration: none;
    }

    .user-info {
        display: flex;
        flex-direction: column;
    }
    .user-name {
        font-weight: 700;
        color: var(--text-main);
        text-decoration: none;
    }
    .user-plan {
        font-size: 0.8rem;
        color: var(--text-light);
        margin-top: 3px;
    }

    /* Status Dot */
    .status-dot {
        display: inline-flex;
        align-items: center;
        padding: 6px 12px;
        border-radius: 20px;
        font-size: 0.8rem;
        font-weight: 700;
    }
    .dot {
        width: 8px; height: 8px;
        border-radius: 50%;
        margin-right: 8px;
    }
    
    .st-success { background: var(--st-success-bg); color: var(--st-success-txt); }
    .st-success .dot { background: currentColor; }

    .st-wait { background: var(--st-wait-bg); color: var(--st-wait-txt); }
    .st-wait .dot { background: currentColor; }

    .st-fail { background: var(--st-fail-bg); color: var(--st-fail-txt); }
    .st-fail .dot { background: currentColor; }
    
    .st-gray { background: var(--st-gray-bg); color: var(--st-gray-txt); }
    .st-gray .dot { background: currentColor; }
    
    .st-cancel { background: var(--st-cancel-bg); color: var(--st-cancel-txt); }
    .st-cancel .dot { background: currentColor; }

    /* Price */
    .price-tag {
        font-weight: 700;
        color: var(--text-main);
        letter-spacing: -0.5px;
    }

    /* Actions */
    .action-link {
        color: var(--text-light);
        margin-left: 15px;
        font-size: 1.1rem;
        transition: all 0.2s;
        text-decoration: none;
    }
    .action-link:hover {
        color: var(--brand-color);
        transform: scale(1.1);
    }

    /* Footer */
    .card-footer {
        padding: 25px 30px;
        display: flex;
        justify-content: flex-end;
    }

    /* Mobile */
    @media (max-width: 768px) {
        .card-toolbar {
            flex-direction: column-reverse;
            align-items: stretch;
        }
        .search-box { max-width: 100%; }
        .limit-wrapper { justify-content: space-between; }
        .top-header { flex-direction: column; align-items: flex-start; }
    }

</style>

<div class="app-wrapper">
    <div class="app-container">
        
        <div class="top-header">
            <div>
                <h1 class="page-heading">Transactions</h1>
                <div class="sub-heading">Viewing history for <b>{ucwords($pg)}</b> gateway</div>
            </div>
            <a href="{Text::url('paymentgateway')}" class="btn-nav-back">
                <i class="fa fa-arrow-left"></i> Gateways
            </a>
        </div>

        <div class="data-card">
            
            <div class="card-toolbar">
                <form id="audit-form" method="post" action="{Text::url('paymentgateway/audit/')}{$pg}" style="display:contents;">
                    
                    <div class="search-box">
                        <i class="fa fa-search"></i>
                        <input type="text" name="q" placeholder="{Lang::T('Search transactions...')}" value="{$q}">
                    </div>

                    <div class="limit-wrapper">
                        <span class="limit-label">Show:</span>
                        <select name="limit" class="limit-select" onchange="this.form.submit()">
                            <option value="10" {if $limit == 10}selected{/if}>10</option>
                            <option value="20" {if $limit == 20}selected{/if}>20</option> <option value="25" {if $limit == 25}selected{/if}>25</option>
                            <option value="50" {if $limit == 50}selected{/if}>50</option>
                            <option value="100" {if $limit == 100}selected{/if}>100</option>
                        </select>
                    </div>

                </form>
            </div>

            <div class="table-responsive">
                <table class="airy-table">
                    <thead>
                        <tr>
                            <th>Status</th>
                            <th>Gateway TRX</th>
                            <th>Customer</th>
                            <th>Amount</th>
                            <th>Date</th>
                            <th style="text-align:right;">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach $pgs as $pg_row}
                            <tr>
                                <td>
                                    {if $pg_row['status'] == 2}
                                        <div class="status-dot st-success"><span class="dot"></span> Paid</div>
                                    {elseif $pg_row['status'] == 1}
                                        <div class="status-dot st-wait"><span class="dot"></span> Unpaid</div>
                                    {elseif $pg_row['status'] == 3}
                                        <div class="status-dot st-fail"><span class="dot"></span> Failed</div>
                                    {elseif $pg_row['status'] == 4}
                                        <div class="status-dot st-cancel">
                                            <span class="dot"></span> Cancelled</div>
                                    {else}
                                        <div class="status-dot st-gray"><span class="dot"></span> Unknown</div>
                                    {/if}
                                </td>

                                <td>
                                    <a href="{Text::url('paymentgateway/audit-view/')}{$pg_row['id']}" class="trx-id">
                                        {$pg_row['gateway_trx_id']}
                                    </a>
                                    <div style="font-size:0.75rem; color:var(--text-light); margin-top:4px;">#{$pg_row['id']}</div>
                                </td>

                                <td>
                                    <div class="user-info">
                                        <a href="{Text::url('customers/viewu/')}{$pg_row['username']}" class="user-name">
                                            {$pg_row['username']}
                                        </a>
                                        <span class="user-plan">{$pg_row['plan_name']}</span>
                                    </div>
                                </td>

                                <td>
                                    <span class="price-tag">{Lang::moneyFormat($pg_row['price'])}</span>
                                </td>

                                <td>
                                    {if $pg_row['created_date']}
                                        <div style="font-weight:600; color:var(--text-main);">{Lang::dateTimeFormat($pg_row['created_date'])}</div>
                                        <div style="font-size:0.75rem; color:var(--text-light);">Created</div>
                                    {else}
                                        -
                                    {/if}
                                </td>

                                <td style="text-align:right;">
                                    <a href="{Text::url('paymentgateway/audit-view/')}{$pg_row['id']}" class="action-link" title="View Details">
                                        <i class="fa fa-eye"></i>
                                    </a>
                                    {if $pg_row['pg_url_payment']}
                                        <a href="{$pg_row['pg_url_payment']}" target="_blank" class="action-link" title="External Link">
                                            <i class="fa fa-external-link"></i>
                                        </a>
                                    {/if}
                                </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>

            <div class="card-footer">
                {include file="pagination.tpl"}
            </div>
            
        </div>
    </div>
</div>

{include file="sections/footer.tpl"}

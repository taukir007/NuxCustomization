# PHPNuxbill UI Customizations 🎨

Welcome to **NuxCustomization**  
A collection of **modern, responsive, and professional UI customizations** for PHPNuxbill.

🔗 **Official PHPNuxbill Repository**  
https://github.com/hotspotbilling/phpnuxbill

The goal of this project is to enhance the **visual experience** of PHPNuxbill without breaking core functionality.

All UI overrides are implemented using the `ui_custom` directory to ensure:
- ✅ Update safety
- ✅ Easy installation
- ✅ Long-term maintainability

---

## 📦 Available Customization Modules

Click a module name to jump to its section:

- [Payment Gateway Admin UI (Modern Redesign)](#-payment-gateway-admin-ui-modern-redesign)

> More modules will be added in the future.

---
## 🔹 Payment Gateway Admin UI (Modern Redesign)

<details>
<summary><strong>Click to expand / collapse module details</strong></summary>

### 📁 Module Location
```
/Admin-PaymentGateway-UI
```

### 🧩 Overview
A complete visual redesign of the **Payment Gateway Management** section in the PHPNuxbill Admin Panel.

This module focuses on:
- Improved readability
- Modern dashboard aesthetics
- Clear data separation
- Mobile-first responsiveness

All while remaining **fully compatible** with PHPNuxbill’s backend logic.

---

### ✨ Features

#### Gateway List
- Card-based modern layout
- Circular gateway logos
- iOS-style enable/disable toggles
- Clean spacing and typography

#### Audit Log
- Responsive and readable table
- Color-coded status indicators
- Dynamic “Show Entries (10 / 25 / 50 / 100)” dropdown
- Search-friendly UI

#### Audit View (Details Page)
- Dashboard-style hero status banner
- 3-column structured details grid
- Hacker-style terminal log viewer
- Clear transaction metadata separation

#### Mobile Support
- Fully responsive
- Optimized for tablets and smartphones

---

## 🚀 Installation Guide

### Step 1: Upload UI Files

Copy the contents of:
```
Admin-PaymentGateway-UI
```

Into:
```
/ui/ui_custom/admin/paymentgateway/
```

If the `ui_custom` directory does not exist, create it manually to keep updates safe.

---

### Step 2: Upload Assets

Upload the default gateway logo:
```
/ui/ui_custom/admin/paymentgateway/pg-logo.png
```

---

## ⚙️ Required Core Modification

Some UI features (such as the dynamic **Show Entries** dropdown) require a small controller update.

### Controller Update – Audit Pagination

**File:**
```
/system/controllers/paymentgateway.php
```

**Find:**
```
case 'audit':
```

**Replace with:**
```php
case 'audit':
    $pg = alphanumeric($routes[2]);
    $q = alphanumeric(_req('q'), '-._ ');

    $limit = _req('limit') ? (int)_req('limit') : 50;

    $query = ORM::for_table('tbl_payment_gateway')->order_by_desc("id");
    $query->selects(
        'id','username','gateway','gateway_trx_id',
        'plan_id','plan_name','routers_id','routers',
        'price','pg_url_payment','payment_method',
        'payment_channel','expired_date','created_date',
        'paid_date','trx_invoice','status'
    );
    $query->where('gateway', $pg);

    $append_url_params = [];
    if (!empty($q)) {
        $query->whereRaw("(gateway_trx_id LIKE '%$q%' OR username LIKE '%$q%' OR routers LIKE '%$q%' OR plan_name LIKE '%$q%')");
        $append_url_params[] = 'q=' . urlencode($q);
    }

    if ($limit != 50) {
        $append_url_params[] = 'limit=' . $limit;
    }

    $append_url = implode('&', $append_url_params);

    $pgs = Paginator::findMany($query, ['search' => $search], $limit, $append_url);

    $ui->assign('_title', 'Payment Gateway Audit');
    $ui->assign('pgs', $pgs);
    $ui->assign('pg', $pg);
    $ui->assign('q', $q);
    $ui->assign('limit', $limit);

    $ui->display('admin/paymentgateway/audit.tpl');
    break;
```

</details>

---

## 🔗 Related Projects

- **bKash Payment Gateway Plugin**  
  A standalone, modern bKash payment gateway plugin that pairs well with this UI.
 > ** Check Here: [taukir007/BkashGateway-NuX](https://github.com/taukir007/BkashGateway-NuX)

---

## 🤝 Contributing

Contributions are welcome.

1. Fork the repository  
2. Add your module in a separate folder  
3. Update the module list  
4. Submit a pull request  

---

## 📜 License

This project is licensed under the **MIT License**.  
Free to use, modify, and distribute.

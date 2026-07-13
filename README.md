# Safe-Sub | قالب اشتراک سفارشی برای 3x-ui

<div align="center">

![Preview](https://raw.githubusercontent.com/Safe-Net5/Safe-Sub/main/preview.png)

**قالب اشتراک مدرن، فارسی و کاملاً قابل شخصی‌سازی برای پنل 3x-ui**

</div>

---

## ✨ پیش‌نمایش

**Safe-Sub** یک قالب اشتراک حرفه‌ای برای **3x-ui** است که امکان شخصی‌سازی کامل نام برند، ربات، کانال و پشتیبانی را تنها با یک دستور فراهم می‌کند.

---

## 🚀 امکانات

- نصب تنها با یک دستور
- سازگار با آخرین نسخه‌های 3x-ui
- دانلود خودکار آخرین قالب از GitHub
- شخصی‌سازی نام برند
- شخصی‌سازی آیدی ربات تلگرام
- شخصی‌سازی آیدی کانال تلگرام
- شخصی‌سازی آیدی پشتیبانی
- جایگزینی خودکار اطلاعات داخل قالب
- ساخت خودکار فایل‌های `index.html` و `sub.html`
- طراحی مدرن، فارسی و واکنش‌گرا
- پشتیبانی از حالت تاریک
- بدون نیاز به ویرایش دستی فایل‌ها

---

## 📥 نصب

دستور زیر را روی سرور اجرا کنید:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Safe-Net5/Safe-Sub/main/install.sh)
```

---

## 📝 اطلاعات موردنیاز

پس از اجرای اسکریپت، اطلاعات زیر از شما دریافت می‌شود:

- نام برند
- آیدی ربات تلگرام (بدون `@`)
- آیدی کانال تلگرام (بدون `@`)
- آیدی پشتیبانی (بدون `@`)

نمونه:

```text
Brand Name: SafeVPN
Bot Username: VpnSafee_bot
Channel Username: SafeVpn13
Support Username: SafeVpn5
```

---

## ⚙️ راهنمای فعال‌سازی در 3x-ui

پس از پایان نصب:

1. وارد پنل **3x-ui** شوید.
2. به بخش **Subscription Settings** بروید.
3. در قسمت **Custom Path** مسیر زیر را وارد کنید:

```text
/usr/local/x-ui/sub_templates/safevpn
```

4. تنظیمات را ذخیره کنید.

در صورت نیاز سرویس را ری‌استارت کنید:

```bash
systemctl restart x-ui
```

---

## 📂 محل نصب فایل‌ها

پس از نصب، فایل‌های قالب در مسیر زیر ایجاد می‌شوند:

```text
/usr/local/x-ui/sub_templates/safevpn
```

فایل‌های ایجاد شده:

```text
index.html
sub.html
```

---

## 🔄 نصب مجدد

اگر قبلاً قالب را نصب کرده‌اید، قبل از اجرای مجدد اسکریپت، قالب قبلی را حذف کنید:

```bash
rm -rf /usr/local/x-ui/sub_templates/safevpn
```

سپس دوباره دستور نصب را اجرا کنید:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Safe-Net5/Safe-Sub/main/install.sh)
```

---

## 📋 پیش‌نیازها

- Linux VPS
- دسترسی Root
- نصب بودن `curl`
- نصب بودن `3x-ui`

---

## 🤝 مشارکت

اگر پیشنهادی برای بهبود پروژه دارید، خوشحال می‌شویم از طریق GitHub آن را با ما در میان بگذارید.

---

## 📄 مجوز

این پروژه تحت مجوز **MIT License** منتشر شده است.

---

<div align="center">

**ساخته شده با ❤️ توسط Safe-Net**

</div>

# Kommodo Digital Newsletter — Deployment Guide

## 🎯 Goal
Host your newsletter at `newsletter.kommodo.io` with full design preserved.

---

## 📁 Folder Structure

```
github-pages-deploy/
├── index.html              # Archive/homepage (newsletter.kommodo.io)
├── CNAME                   # Custom domain config
├── DEPLOYMENT_GUIDE.md     # This file
└── editions/
    └── great-rotation.html # Edition #001 (newsletter.kommodo.io/editions/great-rotation.html)
```

---

## 🚀 PART 1: GitHub Pages Setup (5 minutes)

### Step 1: Create a GitHub Repository

1. Go to [github.com](https://github.com) and sign in (or create account)
2. Click the **+** icon (top right) → **New repository**
3. Settings:
   - **Repository name:** `kommodo-newsletter`
   - **Description:** `Kommodo Digital Newsletter Archive`
   - **Visibility:** Public (required for free GitHub Pages)
   - ✅ Check "Add a README file"
4. Click **Create repository**

### Step 2: Upload Files

1. In your new repository, click **Add file** → **Upload files**
2. Drag and drop ALL files from this `github-pages-deploy` folder:
   - `index.html`
   - `CNAME`
   - `editions/` folder (with `great-rotation.html` inside)
3. Scroll down, add commit message: `Initial newsletter deployment`
4. Click **Commit changes**

### Step 3: Enable GitHub Pages

1. In your repository, go to **Settings** (tab at top)
2. Scroll down to **Pages** (left sidebar)
3. Under "Source", select:
   - **Branch:** `main`
   - **Folder:** `/ (root)`
4. Click **Save**
5. Wait 1-2 minutes for deployment

### Step 4: Verify Default URL

Before custom domain setup, verify it works at:
```
https://YOUR-GITHUB-USERNAME.github.io/kommodo-newsletter/
```

---

## 🌐 PART 2: Wix DNS Setup (10 minutes)

### Step 1: Access Wix DNS Settings

1. Log in to your **Wix account**
2. Go to your **Dashboard**
3. Click **Settings** → **Domains**
4. Find `kommodo.io` and click **Manage**
5. Click **Manage DNS Records** (or "Advanced DNS")

### Step 2: Add CNAME Record

Add a new DNS record with these settings:

| Field | Value |
|-------|-------|
| **Type** | `CNAME` |
| **Host/Name** | `newsletter` |
| **Points to / Value** | `YOUR-GITHUB-USERNAME.github.io` |
| **TTL** | `3600` (or default) |

> ⚠️ Replace `YOUR-GITHUB-USERNAME` with your actual GitHub username!

**Example:**
If your GitHub username is `kommodo-digital`, the value would be:
```
kommodo-digital.github.io
```

### Step 3: Save and Wait

1. Click **Save** or **Add Record**
2. DNS propagation takes **5-30 minutes** (sometimes up to 24 hours)
3. You can check propagation at: [dnschecker.org](https://dnschecker.org)

### Step 4: Configure Custom Domain in GitHub

1. Go back to your GitHub repository
2. Go to **Settings** → **Pages**
3. Under "Custom domain", enter: `newsletter.kommodo.io`
4. Click **Save**
5. Wait a few minutes, then check ✅ **Enforce HTTPS**

---

## ✅ Final URLs

Once complete, your newsletter will be live at:

| URL | Content |
|-----|---------|
| `https://newsletter.kommodo.io` | Archive homepage |
| `https://newsletter.kommodo.io/editions/great-rotation.html` | Edition #001 |

---

## 🔄 Adding Future Editions

1. Create new HTML file in `editions/` folder (e.g., `edition-002.html`)
2. Update `index.html` to add the new edition to the list
3. Upload both files to GitHub
4. Changes go live automatically in ~1 minute

---

## 🔧 Troubleshooting

### "Site not found" error
- DNS may not have propagated yet. Wait 30 minutes and try again.
- Verify CNAME record is correct in Wix DNS.

### HTTPS not working
- In GitHub Pages settings, ensure "Enforce HTTPS" is checked.
- May take up to 24 hours for SSL certificate provisioning.

### TradingView chart not loading
- Charts require HTTPS. Ensure your site uses `https://`.
- If still not working, try refreshing the page or clearing browser cache.

### Changes not appearing
- GitHub Pages can take 1-2 minutes to update.
- Try hard refresh: `Cmd+Shift+R` (Mac) or `Ctrl+Shift+R` (Windows).

---

## 📧 Linking from Substack

Once your newsletter is hosted, add a prominent link in your Substack posts:

```markdown
📖 **[Read the full edition with interactive charts →](https://newsletter.kommodo.io/editions/great-rotation.html)**
```

Or use HTML in Substack:

```html
<p style="text-align: center; padding: 20px; background: #f5f5f5; border-radius: 8px;">
  <strong>📖 <a href="https://newsletter.kommodo.io/editions/great-rotation.html">Read the full edition with interactive charts →</a></strong>
</p>
```

---

## 📞 Support

Questions? The CNAME and GitHub Pages setup is standard — any web hosting guide for "GitHub Pages custom domain" will help.

**Created:** December 11, 2025  
**Last Updated:** December 11, 2025

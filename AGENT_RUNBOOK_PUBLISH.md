# Kommodo Newsletter — Publish Runbook (Agent)

## Objective
Publish the new edition HTML to the GitHub Pages repo and make it the Latest Edition on index.html. **This sequence is locked; run exactly in order.**

---

## Locked workflow (deterministic)

The Cursor agent **must** run this sequence every time:

### Step 1 — Ensure edition HTML exists at target path
- Path: `editions/Kommodo_Digital-v0.2/<slug>_v02.html`
- If missing: copy from workspace `github-pages-deploy/editions/Kommodo_Digital-v0.2/<slug>_v02.html` into the Pages repo (`~/projects/kommodo-newsletter/`).
- Confirm: `[[ -f editions/Kommodo_Digital-v0.2/<slug>_v02.html ]]` (or equivalent check).

### Step 2 — Update index.html Latest Edition links
- Edit `index.html` in the **Pages repo**:
  - Latest Edition card: `href` and card content (edition number, title, subtitle, date, meta).
  - "Read Full Analysis →" button: `href`.
  - Footer "Latest Edition" link: `href`.
- All three must point to: `editions/Kommodo_Digital-v0.2/<slug>_v02.html`.

### Step 3 — Run the publish script
From **Pages repo root** (`~/projects/kommodo-newsletter`):

```bash
./scripts/publish_edition.sh editions/Kommodo_Digital-v0.2/<slug>_v02.html "Add Edition #00X — <Title>"
```

Example:
```bash
./scripts/publish_edition.sh editions/Kommodo_Digital-v0.2/Inflection_or_Exhaustion_v02.html "Add Edition #002 — Inflection or Exhaustion?"
```

### Step 4 — Output (required)
After the script succeeds, the agent **must** output:

1. **Live URL:**  
   `https://newsletter.kommodo.io/editions/Kommodo_Digital-v0.2/<slug>_v02.html`

2. **Last commit hash:**  
   `git log -1 --oneline` (e.g. `76391cb Add Edition #002 — Inflection or Exhaustion?`)

3. **Git status (must be clean):**  
   `git status` — working tree clean; no unstaged or uncommitted changes. If not clean, report and fix.

---

## Allowed operations
- Edit HTML in `editions/Kommodo_Digital-v0.2/`.
- Edit `index.html` to point Latest Edition to the new edition.
- Run `git status` / `diff` / `add` / `commit` / `push` (via script or equivalent).
- **Never** touch CNAME, DNS, or repo settings.

---

## Success criteria
- Commit on `main` exists.
- GitHub Pages serves the live URL.
- `index.html` points to the new edition in all three places.
- `git status` is clean after push.

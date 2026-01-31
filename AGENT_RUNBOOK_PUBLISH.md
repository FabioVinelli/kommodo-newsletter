# Kommodo Newsletter — Publish Runbook (Agent)

## Objective
Publish the new edition HTML to the GitHub Pages repo and make it the Latest Edition on index.html.

## Allowed operations
- edit HTML file in editions/Kommodo_Digital-v0.2/
- edit index.html to point Latest Edition to the new edition
- run git status / diff / add / commit / push
- never touch CNAME, DNS, or repo settings

## Steps
1) Confirm repo root has CNAME = newsletter.kommodo.io
2) Ensure edition HTML exists at:
   editions/Kommodo_Digital-v0.2/<slug>_v02.html
3) Update index.html "Latest Edition" link to that path
4) Run:
   ./scripts/publish_edition.sh editions/Kommodo_Digital-v0.2/<slug>_v02.html "Add Edition #00X — <Title>"
5) Output the live URL and confirm it matches the path.

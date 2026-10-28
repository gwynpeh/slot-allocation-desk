# Cargoflow Mgnt Tool — Slot Allocation Desk

Prototype for PIL HQ Trade and port agents to release, book and monitor vessel slot allocation (BSA) by port of load and port of discharge, in TEU and tonnage.

Covers: allocation and balance pool, forecast vs booked vs loaded, additional loading approvals, reefer plugs, equipment and special cargo (DG / OOG), contract reserves, release rules, schedule changes, intra-Asia onward limits and first-leg delay impact, port performance, and a heatmap across vessels.

**All figures are sample data.** Nothing is connected to live booking, schedule or load-list systems yet, and changes are saved only in each viewer's own browser.

## Files

- `slot-allocation-desk.html` – the desk itself (page content).
- `index.html` – generated full web page that Vercel serves. Do not edit by hand.
- `build-index.ps1` – rebuilds `index.html` after any change to the desk file.

## Update and publish

```powershell
.\build-index.ps1
git add -A
git commit -m "Describe the change"
git push
```

Vercel redeploys automatically on every push to `main`.

# CLAUDE.md

## Overview

This is the **Atomic Labs Content Network** monorepo. It contains site configurations, articles, and assets for 47+ content sites deployed via Cloudflare Workers + KV.

## Architecture

- **Sites**: `sites/<domain>/` — each site has `site.yaml`, `articles/*.md`, `assets/`, `skill.md`
- **Groups**: `groups/<group>.yaml` — shared config (ads, tracking, scripts) inherited by sites
- **Org/Network**: `org.yaml`, `network.yaml` — global defaults
- **Dashboard**: `dashboard-index.yaml` — central registry of all sites
- **Scheduler**: `scheduler/config.yaml` — content generation schedule

## Git Branch Strategy

- **main** — production. Syncs to `KV_NAMESPACE_ID_PROD`.
- **staging/<domain>** — per-site staging branches. Sync to `KV_NAMESPACE_ID_STAGING`.
- Each staging branch only touches its own `sites/<domain>/` directory.
- Merge staging to main to publish: `git merge origin/staging/<domain> -m "site(<domain>): publish staging edits to production"`

## KV Sync Workflow (`.github/workflows/sync-kv.yml`)

Triggered on push to `main` or `staging/**` when `sites/`, `groups/`, `overrides/`, `org.yaml`, or `network.yaml` change. Also supports `workflow_dispatch` with `site` and `force_all` inputs.

### Key commands

```bash
# Sync a single site (staging)
gh workflow run "Sync network data to KV" -f site=<domain> --ref staging/<domain>

# Sync ALL sites (production)
gh workflow run "Sync network data to KV" -f force_all=true --ref main
```

## IMPORTANT: Avoiding GitHub API Rate Limits

**Never push to multiple staging branches in rapid succession.** Each push triggers a separate workflow run, which checks out the `atomicfuse/atomic-content-platform` repo using `PLATFORM_REPO_TOKEN`. Pushing 47 branches = 47 runs = 47 API calls to clone the platform repo, which can exhaust the GitHub API rate limit (5000/hour).

### When updating all staging branches (e.g., syncing statuses from main):

1. Use `[skip ci]` in commit messages when pushing to staging branches to prevent triggering workflows:
   ```bash
   git merge main --no-edit -m "chore(<domain>): sync from main [skip ci]"
   ```
2. After all staging branches are pushed, trigger a single `force_all` sync:
   ```bash
   gh workflow run "Sync network data to KV" -f force_all=true --ref main
   ```

### When merging all staging branches to main:

1. Merge all staging branches into main locally (no workflows triggered yet).
2. Push main once — this triggers one workflow run.
3. Then trigger `force_all` to ensure all sites are synced:
   ```bash
   gh workflow run "Sync network data to KV" -f force_all=true --ref main
   ```

## Article Status

Articles use `status: review` or `status: published` in frontmatter. To flip all review articles to published across all sites:

```bash
grep -rl '^status: review' sites/*/articles/*.md | while IFS= read -r f; do
  sed -i '' 's/^status: review$/status: published/' "$f"
done
```

## Platform Dependency

The sync workflow checks out `atomicfuse/atomic-content-platform` (private repo) using `PLATFORM_REPO_TOKEN` secret. If syncs fail at the "Checkout platform code" step with 403, the token has likely expired — regenerate it and update the repo secret.

## Dev1 Sites

`financenewsbase` and `muvizzcom` use separate Cloudflare credentials (`DEV1_*` secrets) on a different account.

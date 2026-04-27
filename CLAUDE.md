# CLAUDE.md

## Overview

Atomic Labs Network — pure data repo for the Atomic Content Network platform.
Contains YAML site configs, markdown articles, and site assets. Zero code lives here.

## Structure

```
sites/{domain}/
  site.yaml          ← site config (theme, ads, tracking, etc.)
  assets/            ← logo, favicon, images
  articles/          ← AI-generated markdown articles
groups/{group}.yaml  ← shared config applied to multiple sites
org.yaml             ← org-wide defaults
network.yaml         ← network manifest
```

## Article Files

- Location: `sites/{domain}/articles/{slug}.md`
- Filename: kebab-case slug (e.g. `best-thriller-movies-2026.md`)
- Frontmatter fields: `title`, `description`, `pubDate`, `author`, `category`, `tags`, `featuredImage`
- Pushing a new article to `main` automatically triggers a Cloudflare Pages rebuild for that site

## Deployment

Data changes in this repo trigger automatic Cloudflare Pages deploys:

| Change | What builds |
|--------|------------|
| `sites/{domain}/**` | Only that site |
| `groups/{group}.yaml` | All sites in that group |
| `org.yaml` or `network.yaml` | All sites |

PRs against `main` create a Cloudflare preview URL. Merging to `main` deploys to production.

## Git Workflow

**Branch rules — follow these on every commit/push without being asked:**

- Asaf works on `asaf-dev`. Michal works on `michal-dev`. **Never commit directly to `main`.**
- When asked to "commit and push": stage the relevant files, write a clear commit message, commit to the current dev branch, and push to `origin/<branch>`.
- When work is ready for review: open a PR from the dev branch to `main` using `gh pr create`. Do not merge directly.
- Never touch the other developer's branch.
- Always run `git branch --show-current` to confirm you are on the right branch before committing.

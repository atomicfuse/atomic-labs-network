# QA: coolnews-atl — Verify Against New Monetization Layer Architecture

**Site:** coolnews-atl
**Network repo branch:** `staging/coolnews-atl` (site config) + `main` (org.yaml, groups/, monetization/, dashboard-index.yaml)
**Pages URL:** `coolnews-atl.pages.dev` (staging: `staging-coolnews-atl.coolnews-atl.pages.dev`)

---

## Phase 0: Read Current State

Before testing anything, read every file to understand what coolnews-atl currently has.

```bash
cd ~/Documents/ATL-content-network/atomic-labs-network

# Main branch files
git checkout main
cat org.yaml
cat network.yaml
cat dashboard-index.yaml
ls monetization/
cat monetization/*.yaml 2>/dev/null || echo "No monetization dir yet"
ls groups/
cat groups/*.yaml

# coolnews-atl site files (on staging branch)
git checkout staging/coolnews-atl
cat sites/coolnews-atl/site.yaml
ls sites/coolnews-atl/
ls sites/coolnews-atl/articles/ 2>/dev/null | head -5
```

Document what you find. Then compare against the expected structure below.

---

## Phase 1: site.yaml Structure Validation

### Check 1.1 — Required fields present

Open `sites/coolnews-atl/site.yaml`. It MUST have:

```yaml
domain: coolnews-atl              # ✓ or ✗
site_name: "..."                   # ✓ or ✗
group: <content-group-id>          # ✓ or ✗ — must reference a file in groups/
monetization: <monetization-id>    # ✓ or ✗ — must reference a file in monetization/
active: true                       # ✓ or ✗
```

**If `monetization:` is missing** → this is the main thing to fix. Add it.

**If `group:` still says `premium-ads`** → broken reference. premium-ads is now a monetization profile, not a group. Fix it to a content group (entertainment, news, etc.).

### Check 1.2 — Brief structure

The `brief:` section must have the new schema:

```yaml
brief:
  audience: "..."                  # ✓ or ✗
  tone: "..."                      # ✓ or ✗
  article_types:                   # ✓ or ✗ — if missing, add with defaults
    standard: 60
    listicle: 40
  topics: [...]                    # ✓ or ✗
  seo_keywords_focus: [...]        # ✓ or ✗ — if missing, add empty array
  content_guidelines: "..."        # ✓ or ✗
  review_percentage: 5             # ✓ or ✗ — if missing, add default
  schedule:
    articles_per_week: N           # ✓ or ✗
    # OR articles_per_day: N       # either works, scheduler handles both
    preferred_days: [...]          # ✓ or ✗
    preferred_time: "HH:MM"       # ✓ or ✗ — if missing, add "10:00"
```

**Legacy fields to check:** If the site has `content:` instead of `brief:` (old schema from the K8s era), it needs to be renamed and restructured.

### Check 1.3 — scripts_vars present

If the site's monetization profile uses `{{placeholder}}` patterns in its scripts, the site MUST have matching `scripts_vars`:

```bash
# Check what placeholders the monetization profile expects
grep -o '{{[^}]*}}' monetization/<profile>.yaml | sort -u
```

Each placeholder must have a corresponding entry in the site's `scripts_vars:`. If missing, the config resolution will throw an error.

### Check 1.4 — Theme structure

```yaml
theme:
  base: modern | editorial         # ✓ or ✗
  colors:                          # optional — inherits from group
    primary: "..."
    accent: "..."
  logo: /assets/logo.svg           # ✓ or ✗
  favicon: /assets/favicon.png     # ✓ or ✗
  fonts:                           # optional — inherits from group/org
    heading: "..."
    body: "..."
```

### Check 1.5 — Tracking overrides (if any)

```yaml
tracking:                          # optional — inherits from monetization
  ga4: "G-COOLNEWS-XXX"           # site-specific GA4 if needed
```

If coolnews-atl doesn't need site-specific tracking, the `tracking:` section can be omitted entirely (inherits from monetization profile).

### Check 1.6 — No orphaned fields

The site.yaml should NOT have these (they belong in monetization.yaml now, not site.yaml):

- ✗ `ads_config:` with `ad_placements` (unless intentionally overriding)
- ✗ `scripts:` with ad network entries (those come from monetization)
- ✗ `ads_txt:` (unless site-specific entries needed)

---

## Phase 2: Reference Integrity

### Check 2.1 — Group reference valid

```bash
git checkout main
SITE_GROUP=$(grep "^group:" sites/coolnews-atl/site.yaml 2>/dev/null || git checkout staging/coolnews-atl && grep "^group:" sites/coolnews-atl/site.yaml)
echo "Site references group: $SITE_GROUP"
ls groups/ | grep "$SITE_GROUP"
# MUST find a matching .yaml file
```

If the group file doesn't exist → create it or fix the reference.

### Check 2.2 — Monetization reference valid

```bash
SITE_MONET=$(grep "^monetization:" sites/coolnews-atl/site.yaml)
echo "Site references monetization: $SITE_MONET"
ls monetization/ | grep "$SITE_MONET"
# MUST find a matching .yaml file
```

If the monetization file doesn't exist → the site falls back to `org.default_monetization`. Verify that fallback works.

### Check 2.3 — dashboard-index.yaml includes coolnews-atl

```bash
git checkout main
grep "coolnews-atl" dashboard-index.yaml
```

Must show an entry with domain, status, staging_branch, pages_project.

### Check 2.4 — No broken cross-references

```bash
# All groups referenced by sites must exist
for dir in sites/*/; do
  g=$(grep "^group:" "${dir}site.yaml" 2>/dev/null | awk '{print $2}')
  if [ -n "$g" ] && [ ! -f "groups/${g}.yaml" ]; then
    echo "BROKEN: ${dir} references group '$g' but groups/${g}.yaml missing"
  fi
done

# All monetization profiles referenced by sites must exist
for dir in sites/*/; do
  m=$(grep "^monetization:" "${dir}site.yaml" 2>/dev/null | awk '{print $2}')
  if [ -n "$m" ] && [ ! -f "monetization/${m}.yaml" ]; then
    echo "BROKEN: ${dir} references monetization '$m' but monetization/${m}.yaml missing"
  fi
done
```

---

## Phase 3: Config Resolution

### Check 3.1 — resolveConfig succeeds

From the platform repo:
```bash
cd ~/Documents/ATL-content-network/atomic-content-platform

# Run the config resolver against coolnews-atl
SITE_DOMAIN=coolnews-atl NETWORK_DATA_PATH=~/Documents/ATL-content-network/atomic-labs-network \
  npx tsx packages/site-builder/scripts/resolve-config.ts
```

**Expected:** Outputs a valid `ResolvedConfig` JSON with no errors.

**Common failures:**
- "Monetization profile not found" → `monetization:` field in site.yaml doesn't match a file in `monetization/`
- "Group not found" → `group:` field doesn't match a file in `groups/`
- "Unresolved placeholder {{...}}" → site.yaml missing a required `scripts_vars` entry
- YAML parse error → syntax issue in one of the config files

### Check 3.2 — Tracking resolution

From the resolved config, verify tracking chain:

| Field | Expected source | Value |
|---|---|---|
| `tracking.ga4` | site override OR monetization OR org | ? |
| `tracking.gtm` | monetization OR org | ? |
| `tracking.google_ads` | monetization OR org | ? |
| `tracking.facebook_pixel` | org (if set there) OR monetization | ? |

If coolnews-atl has a site-specific `tracking.ga4`, it should override the monetization profile's value. Otherwise it inherits.

### Check 3.3 — Scripts resolution

Verify all `{{placeholders}}` are resolved:

```bash
# In the resolved config, search for any remaining {{ }}
echo "$RESOLVED_CONFIG" | grep -o '{{[^}]*}}'
# MUST return empty — all placeholders resolved
```

### Check 3.4 — ads_txt additive merge

The resolved `ads_txt` should contain entries from:
1. `org.yaml` ads_txt entries (if any)
2. The monetization profile's ads_txt entries
3. The group's ads_txt entries (if any)
4. The site's ads_txt entries (if any)

All combined, deduplicated, sorted.

### Check 3.5 — ad_placements present

The resolved `ads_config.ad_placements` should be a non-empty array (inherited from the monetization profile).

```
Expected placements (if using premium-ads):
- top-banner (above-content)
- in-content-1 (after-paragraph-3)
- in-content-2 (after-paragraph-7)
- in-content-3 (after-paragraph-12)
- sidebar-sticky (sidebar, desktop)
- mobile-anchor (sticky-bottom, mobile)
```

---

## Phase 4: Build Output Verification

### Check 4.1 — Astro build succeeds

```bash
cd ~/Documents/ATL-content-network/atomic-content-platform/packages/site-builder
SITE_DOMAIN=coolnews-atl NETWORK_DATA_PATH=~/Documents/ATL-content-network/atomic-labs-network pnpm build
```

**Expected:** Build completes with no errors.

### Check 4.2 — Paragraph indexing in HTML output

Open any article HTML from the build output:

```bash
cat dist/articles/*/index.html | grep 'data-p-index' | head -5
```

- [ ] Every `<p>` has `data-p-index="N"` starting from 1
- [ ] Sequential, no gaps
- [ ] Non-paragraph elements (h2, ul, img) do NOT have `data-p-index`

### Check 4.3 — Structural anchor points

```bash
cat dist/articles/*/index.html | grep 'data-slot'
```

- [ ] `data-slot="above-content"` exists
- [ ] `data-slot="sidebar"` exists
- [ ] `data-slot="sticky-bottom"` exists
- [ ] `data-slot="below-content"` exists

### Check 4.4 — CLS placeholder divs

```bash
cat dist/articles/*/index.html | grep 'data-ad-placeholder'
```

- [ ] Hidden placeholder divs exist at positions matching the monetization profile's ad_placements
- [ ] Each has `display: none` and a `min-height`

### Check 4.5 — NO ad-specific elements

```bash
# These should ALL return empty
cat dist/articles/*/index.html | grep 'data-ad-id'       # should be empty
cat dist/articles/*/index.html | grep 'data-sizes-desktop' # should be empty  
cat dist/articles/*/index.html | grep 'class="ad-slot"'   # should be empty
```

### Check 4.6 — Inline tracking in <head>

```bash
cat dist/articles/*/index.html | grep 'gtag\|googletagmanager'
```

- [ ] GA4 snippet present (if tracking.ga4 resolved to a value)
- [ ] GTM snippet present (if tracking.gtm resolved to a value)
- [ ] These are inline in the HTML, not loaded by ad-loader.js

### Check 4.7 — ad-loader.js reference

```bash
cat dist/articles/*/index.html | grep 'ad-loader.js'
```

- [ ] `<script src="...ad-loader.js" async></script>` present before `</body>`

### Check 4.8 — ads.txt generated

```bash
cat dist/ads.txt
```

- [ ] File exists at build output root
- [ ] Contains entries from all config layers
- [ ] Comment headers show source
- [ ] No duplicates

---

## Phase 5: Dashboard Verification

### Check 5.1 — Site shows in dashboard

Open dashboard at `localhost:3001`. Navigate to Sites list.

- [ ] coolnews-atl appears in the list
- [ ] Shows correct group name
- [ ] Shows correct status (staging)

### Check 5.2 — Site detail loads

Click coolnews-atl. Navigate tabs:

- [ ] Config tab loads — shows identity, group, theme
- [ ] Articles tab loads — shows articles from staging branch
- [ ] **Monetization tab exists** — this is new

### Check 5.3 — Monetization tab content

On the Monetization tab:

- [ ] Shows "Monetization profile: premium-ads" (or whatever profile is assigned)
- [ ] Tracking section shows resolved values with source badges
- [ ] Source badges are correct: "From org" / "From monetization: premium-ads" / "Site override"
- [ ] Ad placements visual preview shows the article layout with colored blocks
- [ ] ads.txt preview shows combined entries
- [ ] "Change profile" dropdown works
- [ ] "Regenerate CDN JSON" button exists

### Check 5.4 — Monetization profiles page

Navigate to `/[org]/monetization`:

- [ ] Page loads
- [ ] Lists all profiles from `monetization/` directory
- [ ] Each shows: id, name, provider, site count
- [ ] Click a profile → detail page loads

### Check 5.5 — Monetization profile detail

Click premium-ads profile:

- [ ] General tab: id, name, provider
- [ ] Tracking tab: shows tracking IDs
- [ ] Ad Placements tab: shows all placements with visual preview
- [ ] Scripts tab: shows script entries with `{{placeholder}}` highlighting
- [ ] Script Variables tab: shows default vars
- [ ] ads.txt tab: shows entries
- [ ] Sites tab: shows coolnews-atl (and any other sites using this profile)

### Check 5.6 — Org settings updated

Navigate to org settings:

- [ ] `default_monetization` field visible (should show "standard-ads")
- [ ] `ad_placeholder_heights` section visible
- [ ] `ads_txt` section visible (org-level entries)
- [ ] Tracking section still present (org-level defaults)

### Check 5.7 — Group management slimmed

Navigate to groups:

- [ ] Group detail page shows primarily: theme, legal
- [ ] Ad-related fields either removed or collapsed under "Advanced"
- [ ] No ad_placements editor in group detail (that's in monetization now)

### Check 5.8 — Site creation wizard

Start creating a new site (don't complete it):

- [ ] Step 2 has BOTH: group selector AND monetization selector
- [ ] Selecting a monetization profile shows preview of tracking IDs and ad placements
- [ ] Tracking step pre-fills from the selected monetization profile
- [ ] Script variables step detects required vars from monetization scripts
- [ ] Missing required vars are highlighted

---

## Phase 6: Runtime Ad Injection (Live Site)

### Check 6.1 — Monetization JSON exists

```bash
# If CDN pipeline is set up:
curl -s https://cdn.atomicnetwork.com/m/coolnews-atl.json | python3 -m json.tool

# If testing locally, check the generated JSON:
cat ~/Documents/ATL-content-network/atomic-content-platform/packages/site-builder/.monetization-cache/coolnews-atl.json 2>/dev/null
```

- [ ] Valid JSON with tracking, scripts, ads_config
- [ ] All `{{placeholders}}` resolved
- [ ] `generated_at` is recent

### Check 6.2 — Ad divs appear on the staging site

Open `staging-coolnews-atl.coolnews-atl.pages.dev` in browser. Open DevTools → Elements.

Navigate to an article page:

- [ ] `<div id="ad-top-banner" ...>` exists inside `[data-slot="above-content"]`
- [ ] `<div id="ad-in-content-1" ...>` exists after paragraph 3
- [ ] Sidebar ad exists (if article layout has sidebar)
- [ ] Each ad div has `data-ad-id`, `data-sizes-desktop`, `data-sizes-mobile`
- [ ] "Advertisement" label visible in each slot

### Check 6.3 — Ad network scripts loaded

DevTools → Network tab → filter JS:

- [ ] `ad-loader.js` loaded
- [ ] `monetization.json` fetched (or served from cache)
- [ ] Ad network scripts from the monetization profile loaded (e.g., `gpt.js`, `network-alpha-loader.js`)

### Check 6.4 — Tracking firing

DevTools → Network tab → filter by "google" or "analytics":

- [ ] GA4 request fires on page load (from inline `<head>` script)
- [ ] GTM container loads (if configured)
- [ ] No tracking requests fail with 404/403

### Check 6.5 — Short article test

Find or create an article with only 4-5 paragraphs:

- [ ] `in-content-1` (after-paragraph-3) renders → article has paragraph 3
- [ ] `in-content-2` (after-paragraph-7) does NOT render → article only has 4-5 paragraphs
- [ ] No console errors
- [ ] Page looks clean (no empty gaps where skipped placements would be)

### Check 6.6 — Mobile view

DevTools → toggle device toolbar → select mobile viewport:

- [ ] `sidebar-sticky` (device: desktop) is hidden
- [ ] `mobile-anchor` (device: mobile) is visible at bottom
- [ ] In-content ads visible (device: all)
- [ ] No horizontal scroll caused by ad containers

### Check 6.7 — CLS check

Run Lighthouse on the article page (Performance audit):

- [ ] CLS score < 0.1 (Good)
- [ ] If CLS > 0.1: check which elements shift — likely ad containers loading late

---

## Phase 7: Change-Without-Rebuild Test

This is the most important test — proves the whole point of the architecture.

### Check 7.1 — Change ad placement, verify no rebuild

1. In the dashboard, go to Monetization → premium-ads → Ad Placements
2. Change `in-content-1` position from `after-paragraph-3` to `after-paragraph-5`
3. Save

**Verify:**
- [ ] `monetization/premium-ads.yaml` committed with new position
- [ ] CDN JSON regenerated
- [ ] Cloudflare Pages build log: NO new build triggered for coolnews-atl
- [ ] Reload the article page → ad now appears after paragraph 5 (not 3)

### Check 7.2 — Add a new ad placement

1. In the dashboard, add a new placement:
   - id: "below-article"
   - position: below-content
   - sizes: desktop [[728, 90]], mobile [[320, 50]]
   - device: all
2. Save

**Verify:**
- [ ] New placement appears in monetization.yaml
- [ ] CDN JSON updated
- [ ] No site rebuild
- [ ] Reload article → new ad div appears below content

### Check 7.3 — Change tracking ID

1. In dashboard, go to Monetization → premium-ads → Tracking
2. Change GA4 to a different ID (e.g., "G-NEWTEST123")
3. Save

**Verify:**
- [ ] `monetization/premium-ads.yaml` updated
- [ ] CDN JSON updated with new GA4
- [ ] This DOES trigger a partial site rebuild (inline tracking is build-time)
- [ ] Rebuilt page has new GA4 ID in the inline `<head>` script

### Check 7.4 — Switch monetization profile entirely

1. In dashboard, go to coolnews-atl → Monetization tab
2. Change from `premium-ads` to `standard-ads`
3. Save

**Verify:**
- [ ] `site.yaml` updated with `monetization: standard-ads`
- [ ] CDN JSON regenerated with standard-ads config
- [ ] Page now shows fewer ad slots (standard-ads has only 2 placements vs premium's 6)
- [ ] Ad network scripts changed (AdSense instead of network-alpha)
- [ ] Switch back to premium-ads and verify it restores

---

## Phase 8: Edge Cases

### Check 8.1 — Site with no monetization field

Temporarily remove `monetization:` from coolnews-atl's site.yaml.

- [ ] Config resolution falls back to `org.default_monetization` (standard-ads)
- [ ] No crash, no error
- [ ] Dashboard shows "Using org default: standard-ads" badge

Restore the field after testing.

### Check 8.2 — Empty articles directory

If there's a way to test with zero articles:

- [ ] Site builds successfully
- [ ] Homepage renders (no article cards, or empty state)
- [ ] Ad structural anchors still present in the layout
- [ ] ad-loader.js still loads (but no in-content placements fire — no paragraphs)

### Check 8.3 — Invalid monetization reference

Temporarily set `monetization: nonexistent` in site.yaml.

- [ ] Config resolution throws descriptive error: "Monetization profile 'nonexistent' not found"
- [ ] Dashboard shows error state (not a blank page)

Restore after testing.

### Check 8.4 — CDN JSON fallback

1. Load an article page once (populates localStorage fallback)
2. In DevTools → Network → block the monetization JSON URL
3. Reload

- [ ] Ads still appear (from localStorage cache)
- [ ] Console shows fetch warning but no crash
- [ ] Site content renders normally

---

## Summary Checklist

### Must-pass (blocking):
- [ ] site.yaml has both `group:` and `monetization:` fields
- [ ] All references resolve (group → groups/*.yaml, monetization → monetization/*.yaml)
- [ ] resolveConfig completes without errors
- [ ] Astro build succeeds
- [ ] HTML has paragraph indexing + structural anchors + NO ad-specific divs
- [ ] Inline tracking renders in `<head>`
- [ ] ad-loader.js loads at runtime
- [ ] Ad divs appear at correct positions
- [ ] Changing ad placement does NOT trigger site rebuild

### Should-pass (important but not blocking):
- [ ] Dashboard Monetization tab renders correctly
- [ ] Source badges show correct inheritance chain
- [ ] ads.txt contains entries from all layers
- [ ] CLS score < 0.1
- [ ] CDN fallback works
- [ ] Mobile ad visibility correct

### Nice-to-have (verify when time allows):
- [ ] Interstitial appears and respects session storage
- [ ] Lighthouse performance score stable or improved
- [ ] All dashboard forms save valid YAML
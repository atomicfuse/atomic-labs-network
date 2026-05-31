#!/bin/bash
# publish-site.sh - Safely publish a staging branch to main (production)
#
# This script copies ONLY the target site's files from its staging branch
# to main. It never touches files belonging to other sites, preventing
# the cross-site contamination that happens with naive git merge.
#
# Usage: ./scripts/publish-site.sh <site-name>
# Example: ./scripts/publish-site.sh paleobeasts

set -euo pipefail

SITE="${1:?Usage: ./scripts/publish-site.sh <site-name>}"
STAGING="staging/$SITE"
SITE_DIR="sites/$SITE"

# Validate branch exists
git rev-parse --verify "$STAGING" >/dev/null 2>&1 || {
    echo "Error: Branch '$STAGING' not found"
    exit 1
}

# Ensure clean working tree
if ! git diff-index --quiet HEAD --; then
    echo "Error: Working tree not clean. Commit or stash first."
    exit 1
fi

# Save current branch to return to later
ORIGINAL=$(git branch --show-current)

# Switch to main and pull latest
git checkout main
git pull --ff-only origin main 2>/dev/null || true

# Check if there are any differences for this site
DIFF=$(git diff main "$STAGING" -- "$SITE_DIR")
if [ -z "$DIFF" ]; then
    echo "No changes to publish for $SITE"
    git checkout "$ORIGINAL"
    exit 0
fi

# Show what will change
echo "=== Changes to publish for $SITE ==="
echo ""
git diff --stat main "$STAGING" -- "$SITE_DIR"
echo ""

# Apply ONLY the site's files from the staging branch
git checkout "$STAGING" -- "$SITE_DIR"

# Safety check: verify no files outside site dir were staged
OUTSIDE=$(git diff --cached --name-only | grep -v "^${SITE_DIR}/" || true)
if [ -n "$OUTSIDE" ]; then
    echo "ERROR: Files outside $SITE_DIR were staged. Aborting."
    echo "$OUTSIDE"
    git checkout main -- .
    git checkout "$ORIGINAL"
    exit 1
fi

# Show final summary
echo "Files to publish:"
git diff --cached --stat
echo ""

# Ask for confirmation
read -p "Publish these changes to main? [y/N] " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    git checkout main -- "$SITE_DIR"
    git checkout "$ORIGINAL"
    echo "Cancelled."
    exit 0
fi

# Commit
git commit -m "site($SITE): publish staging edits to production"

echo ""
echo "Published $SITE to main successfully."
echo "  Run 'git push origin main' to push to remote."

# Switch back to original branch
git checkout "$ORIGINAL"

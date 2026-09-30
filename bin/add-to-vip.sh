#!/usr/bin/env bash
# Adds our repo-level tooling to a project built on Automattic's vip-go-skeleton.
# Run from inside that project. See docs/vip-projects.md.
set -euo pipefail

SRC="${TK_SKELETON:-https://github.com/trewknowledge/vip-go-skeleton.git}"
REF="${TK_REF:-production}"
FILES=(
	.wp-env.json
	package.json
	pnpm-workspace.yaml
	pnpm-lock.yaml
	.vscode
	CLAUDE.md
	.github/workflows/tests.yml
	.github/workflows/check-package-lock.yml
)

cd "$(git rev-parse --show-toplevel)"

git fetch --quiet --depth 1 "$SRC" "$REF"
git checkout FETCH_HEAD -- "${FILES[@]}"

# Automattic's skeleton ignores a root package.json, which would hide ours.
if [ -f .gitignore ] && grep -qxF '/package.json' .gitignore; then
	grep -vxF '/package.json' .gitignore > .gitignore.tmp && mv .gitignore.tmp .gitignore
	echo "Removed '/package.json' from .gitignore."
fi

# VIP's layout uses client-mu-plugins/ where ours uses mu-plugins/.
if [ -d client-mu-plugins ]; then
	sed 's|"wp-content/mu-plugins": "./mu-plugins"|"wp-content/client-mu-plugins": "./client-mu-plugins"|' .wp-env.json > .wp-env.json.tmp && mv .wp-env.json.tmp .wp-env.json
	echo "Mapped client-mu-plugins/ in .wp-env.json."
fi

echo "Added: ${FILES[*]}"
echo "Not added on purpose: deploy.yml (VIP deploys itself), composer.json and .phpcs.xml.dist (keep VIP's)."
echo "Next: check that VIP accepts a root package.json, then run 'pnpm install'."

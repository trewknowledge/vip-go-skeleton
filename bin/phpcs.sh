#!/usr/bin/env bash
# Lints only files git would track, so Composer-installed plugins are skipped.
set -euo pipefail
cd "$(git rev-parse --show-toplevel)"
git ls-files -co --exclude-standard -- '*.php' '*.js' | vendor/bin/phpcs --file-list=/dev/stdin "$@"

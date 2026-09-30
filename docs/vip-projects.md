# VIP projects

Projects hosted on VIP start from Automattic's `vip-go-skeleton`, not this one. To add our tooling (wp-env, the test workflow, editor settings) to such a project, run this from inside it:

```bash
curl -fsSL https://raw.githubusercontent.com/trewknowledge/vip-go-skeleton/production/bin/add-to-vip.sh | bash
```

Or copy `bin/add-to-vip.sh` and run it. Re-running pulls in updates. `TK_REF` picks another branch.

## What it adds

`.wp-env.json` (mapping VIP's `client-mu-plugins/` instead of `mu-plugins/`), `package.json`, `pnpm-workspace.yaml`, `pnpm-lock.yaml`, `.vscode/`, `CLAUDE.md`, and the `tests.yml` and `check-package-lock.yml` workflows. It also removes `/package.json` from `.gitignore`.

## What it leaves alone

- `deploy.yml`: VIP deploys through its own GitHub integration.
- `composer.json` and `.phpcs.xml.dist`: VIP's versions are tuned for its code review bot. To get our PHPCS tweaks, add `ignore_warnings_on_exit` and the `*/build/*` and `*/tests/*` excludes by hand.

## Check first

Automattic's skeleton ignores a root `package.json` on purpose. Confirm with VIP that a root `package.json` is fine for the project's build before merging it. Generated themes need it: their `setup` and `test:php` scripts call into the root.

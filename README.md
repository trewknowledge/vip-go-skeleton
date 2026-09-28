# WordPress Skeleton Application

Welcome to WordPress! This repository is a starting point for building your WordPress application, including all the base directories.

## Directories

The `docs/` directory is a special directory that contains your documentation for your application. It is not mounted onto your site, but is available for you to use. See [docs/index.php](docs/index.php) for more information.

## Local environment and CI

`.wp-env.json` mounts `themes/`, `plugins/` and `mu-plugins/` into a
[`wp-env`](https://developer.wordpress.org/block-editor/reference-guides/packages/packages-env/)
site. Themes generated with `@trewknowledge/create-theme` install `wp-env` themselves and start it from here via `pnpm env:start` (Docker required).

`.github/workflows/tests.yml` runs PHPCS on the whole repo and, for every theme in `themes/` that has a `package.json`, its JS unit, PHPUnit, E2E and accessibility suites. Node tooling stays inside each theme because a root `package.json` is gitignored.

## Your documentation here

Feel free to add to or replace this README.md content with content unique to your project, for example:

- Project-specific notes; like a list of environments and branches,
- Workflow documentation; so everyone working in this repo can follow a defined process, or
- Instructions for testing new features.

This can be detailed in the `docs/` directory.

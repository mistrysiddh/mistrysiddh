# Siddh's Blueprint

Source for [mistrysiddh.com](https://mistrysiddh.com), a [Hexo](https://hexo.io) blog of technical writing on Linux, containers, networking, security, AI, automation, cloud and self-hosted infrastructure.

The site uses a custom theme, [hexo-theme-siddhs-blueprint](https://github.com/mistrysiddh/hexo-theme-siddhs-blueprint), which is included as a git submodule.

## Requirements

- Node.js (a current LTS release)
- npm
- git

## Getting started

Clone the repo with its theme submodule:

```bash
git clone --recurse-submodules https://github.com/mistrysiddh/mistrysiddh.git
cd mistrysiddh
npm install
```

If you already cloned without `--recurse-submodules`:

```bash
git submodule update --init
```

The theme has its own dependencies. If the build complains about missing modules, run `npm install` inside `themes/siddhs-blueprint` too.

## Commands

| Command | What it does |
| --- | --- |
| `npm run server` | Start the local dev server (http://localhost:4000) |
| `npm run build` | Generate the static site into `public/` |
| `npm run clean` | Remove `public/` and the Hexo cache (`db.json`) |

## Writing posts

Create a new post from the scaffold:

```bash
npx hexo new "My Post Title"
```

This creates `source/_posts/My-Post-Title.md` with the front matter below:

```yaml
---
title: My Post Title
subtitle: ""
description: ""
cover: ""
categories: []
tags: []
date: 2026-01-01 00:00:00
featured: false
version: "v1.0"
---
```

Each category must be defined in both `category_map` (site `_config.yml`) and `category_modules` (theme `_config.yml`). Otherwise the post falls back to a generic module. The theme README's "Writing posts" section lists the valid categories.

Put images in `source/images/` and reference them by path, for example `/images/posts/my-cover.jpg`. Self-host covers rather than hotlinking them.

## Project layout

```
.
├── _config.yml                    # Main Hexo config (site URL, permalinks, plugins)
├── _config.siddhs-blueprint.yml   # Theme config override
├── deploy.sh                      # Atomic release deploy script
├── scaffolds/                     # Templates for new posts, pages and drafts
├── source/
│   ├── _posts/                    # Blog posts (Markdown)
│   ├── images/                    # Post covers and other images
│   ├── tags/ categories/ about/   # Standalone pages
│   └── robots.txt
└── themes/siddhs-blueprint/       # Theme (git submodule)
```

## Deployment

The site is served by nginx from a `current` symlink that points at a timestamped directory under `releases/`. Hexo builds into `public/`, which nginx does not serve. `deploy.sh` publishes the build with a single atomic rename, so the document root is never missing or half-written.

```bash
./deploy.sh              # build, verify, publish
./deploy.sh --dry-run    # build and verify, but don't publish
./deploy.sh --list       # list releases and mark the live one
./deploy.sh --rollback   # point current at the previous release
```

The script keeps the five most recent releases. It also refuses to publish a build that is missing key pages (home, archives, categories, tags, 404) or is suspiciously small.

`releases/` and `current` are git-ignored because they are deploy artifacts.

## Updating the theme

The theme is pinned to a specific commit. After you commit and push changes in `themes/siddhs-blueprint`, commit the updated pointer here:

```bash
git add themes/siddhs-blueprint
git commit -m "Update theme"
```

## Tech stack

- Hexo 8 with the EJS, Stylus and markdown-it renderers (footnotes and task lists enabled)
- Generators for archives, categories, tags, the Atom feed and the sitemap
- nginx serving atomic releases

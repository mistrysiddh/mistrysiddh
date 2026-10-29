#!/usr/bin/env bash
#
# Atomic release deploy for mistrysiddh.com.
#
# nginx serves $ROOT/current, a symlink into $ROOT/releases/<timestamp>.
# Hexo builds into $ROOT/public, which is *not* served — so `hexo generate`
# is just a build again, and publishing is this script and only this script.
#
# Publishing is a single rename(2), so there is never a moment where the
# document root is missing or half-written.
#
#   ./deploy.sh              build, verify, publish
#   ./deploy.sh --dry-run    build and verify, but don't publish
#   ./deploy.sh --list       show releases, marking the live one
#   ./deploy.sh --rollback   repoint current at the previous release
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RELEASES="$ROOT/releases"
CURRENT="$ROOT/current"
BUILD="$ROOT/public"
KEEP=5

# A build missing these is broken regardless of Hexo's exit code.
REQUIRED_PATHS=(index.html archives/index.html categories/index.html tags/index.html 404.html)
MIN_FILES=50

log()  { printf '\033[36m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[33m warn:\033[0m %s\n' "$*" >&2; }
die()  { printf '\033[31mfail:\033[0m %s\n' "$*" >&2; exit 1; }

current_target() {
  [ -L "$CURRENT" ] && readlink -f "$CURRENT" || true
}

cmd_list() {
  local live; live="$(current_target)"
  [ -d "$RELEASES" ] || die "no releases directory yet — run ./deploy.sh first"
  for d in "$RELEASES"/*/; do
    [ -d "$d" ] || continue
    d="${d%/}"
    if [ "$(readlink -f "$d")" = "$live" ]; then
      printf '  %s  \033[32m← live\033[0m\n' "$(basename "$d")"
    else
      printf '  %s\n' "$(basename "$d")"
    fi
  done
}

# Publishing step, shared by deploy and rollback. Symlink then rename, because
# `ln -sfn` over an existing link unlinks before recreating — a window where
# the document root does not resolve. `mv -T` is a single atomic rename.
publish() {
  local target="$1"
  ln -sfn "$target" "$CURRENT.tmp"
  mv -Tf "$CURRENT.tmp" "$CURRENT"
}

verify_build() {
  [ -d "$BUILD" ] || die "build directory $BUILD does not exist"
  local missing=()
  for p in "${REQUIRED_PATHS[@]}"; do
    [ -e "$BUILD/$p" ] || missing+=("$p")
  done
  if [ ${#missing[@]} -gt 0 ]; then
    die "build is missing expected pages: ${missing[*]} — not publishing"
  fi
  local count; count="$(find "$BUILD" -type f | wc -l)"
  [ "$count" -ge "$MIN_FILES" ] ||
    die "build has only $count files (expected >= $MIN_FILES) — not publishing"
  log "build verified: $count files, all required pages present"
}

cmd_rollback() {
  local live; live="$(current_target)"
  local prev=""
  # Releases sort chronologically by name; take the newest that isn't live.
  for d in $(ls -1d "$RELEASES"/*/ 2>/dev/null | sort -r); do
    d="${d%/}"
    [ "$(readlink -f "$d")" = "$live" ] && continue
    prev="$d"; break
  done
  [ -n "$prev" ] || die "no previous release to roll back to"
  publish "$prev"
  log "rolled back to $(basename "$prev")"
}

cmd_deploy() {
  local dry_run="$1"

  log "building into $BUILD (not served)"
  cd "$ROOT"
  npx hexo clean
  npx hexo generate

  verify_build

  if [ "$dry_run" = "yes" ]; then
    log "dry run — build is good, nothing published"
    return 0
  fi

  mkdir -p "$RELEASES"
  local stamp; stamp="$(date +%Y%m%d-%H%M%S)"
  local dest="$RELEASES/$stamp"

  # --link-dest hardlinks files identical to the previous release, so each
  # release costs only what actually changed rather than another full copy.
  local prev; prev="$(current_target)"
  if [ -n "$prev" ] && [ -d "$prev" ]; then
    rsync -a --link-dest="$prev" "$BUILD/" "$dest/"
  else
    rsync -a "$BUILD/" "$dest/"
  fi
  log "staged release $stamp ($(du -sh --apparent-size "$dest" | cut -f1) logical, $(du -sh "$dest" | cut -f1) on disk)"

  publish "$dest"
  log "published — $CURRENT → releases/$stamp"

  # Prune, but never the live release.
  local live; live="$(current_target)"
  local n=0
  for d in $(ls -1d "$RELEASES"/*/ 2>/dev/null | sort -r); do
    d="${d%/}"
    [ "$(readlink -f "$d")" = "$live" ] && continue
    n=$((n + 1))
    if [ "$n" -ge "$KEEP" ]; then
      rm -rf "$d"
      log "pruned old release $(basename "$d")"
    fi
  done
}

case "${1:-}" in
  --list)     cmd_list ;;
  --rollback) cmd_rollback ;;
  --dry-run)  cmd_deploy yes ;;
  "")         cmd_deploy no ;;
  *)          die "unknown option: $1 (see the header of this script)" ;;
esac

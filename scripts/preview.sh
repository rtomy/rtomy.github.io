#!/bin/bash
# Preview the website on this Mac before publishing.
#
#   scripts/preview.sh [port]      then open http://localhost:4000
#
# Builds with Jekyll 3.10, the version GitHub Pages runs, using the Ruby that
# ships with macOS. The first run installs Jekyll into ~/.cache/jekyll-3.10-gems.
# Press Ctrl+C to stop.
set -euo pipefail
cd "$(dirname "$0")/.."
PORT="${1:-4000}"

GEMS="${XDG_CACHE_HOME:-$HOME/.cache}/jekyll-3.10-gems"
if [ ! -f "$GEMS/gems/jekyll-3.10.0/exe/jekyll" ]; then
  echo "First run: installing Jekyll 3.10 into $GEMS ..."
  # --ignore-dependencies skips Jekyll's live-reload and file-watching add-ons,
  # which need a C compiler and are not used here. Everything listed is plain Ruby.
  gem install --ignore-dependencies --no-document --install-dir "$GEMS" \
    jekyll:3.10.0 liquid:4.0.4 kramdown:2.4.0 kramdown-parser-gfm:1.1.0 rexml:3.3.9 \
    rouge:3.30.0 safe_yaml:1.0.5 mercenary:0.3.6 pathutil:0.16.2 forwardable-extended:2.6.0 \
    colorator:1.1.0 addressable:2.8.7 public_suffix:5.1.1 i18n:1.14.7 concurrent-ruby:1.3.5 \
    jekyll-sass-converter:1.5.2 sass:3.7.4 jekyll-seo-tag:2.8.0 jekyll-sitemap:1.4.0 \
    webrick:1.8.2 csv:3.3.2 >/dev/null
fi

# Put each installed gem's code on Ruby's load path directly, so RubyGems does
# not insist on the add-ons skipped above.
export GEM_HOME="$GEMS" GEM_PATH="$GEMS"
RUBYLIB=$(ruby -e 'puts Dir[File.join(ENV["GEM_HOME"], "specifications", "*.gemspec")].map { |f| Gem::Specification.load(f).full_require_paths }.flatten.join(":")')
export RUBYLIB

ruby -W0 "$GEMS/gems/jekyll-3.10.0/exe/jekyll" build
echo "Preview running at http://localhost:$PORT  (press Ctrl+C to stop)"
exec python3 -m http.server "$PORT" --bind 127.0.0.1 --directory _site

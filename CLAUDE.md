# Notes for Claude

Personal academic website of Rimmy E. Tomy (Associate Professor of Accounting,
Penn State Smeal). Jekyll 3.10 site built and hosted by GitHub Pages in classic
"deploy from branch" mode (main, root): pushing to main publishes. The owner
is not a developer, so explain changes in plain language and show a preview
before publishing.

- Papers: `_data/research.yml`; the field reference is at the top of the file.
  Keep titles in double quotes and abstracts as `|` blocks with one paragraph
  per line. The page markup is `_includes/paper.html`.
- Bio: `index.md`. Name, title, contact details, menu: `_config.yml`.
- Uploaded PDFs and images go in `files/` and are linked as `files/NAME.pdf`.
  Each paper's picture is its `image:` and `image_alt:` fields; shrink large
  photos to about 1600px (`sips -Z 1600`) before adding them.
  The CV is always `files/CV_Tomy.pdf`; replace the file and keep the name.
- Preview: `scripts/preview.sh` serves the built site at http://localhost:4000.
  It installs Jekyll 3.10 into ~/.cache on first run (system Ruby 2.6, no
  compiler needed).
- GitHub Pages only runs whitelisted plugins; this site uses jekyll-seo-tag
  and jekyll-sitemap.
- Analytics: GoatCounter (`goatcounter:` in `_config.yml`; dashboard at
  rtomy.goatcounter.com). The script and the PDF-click events are in
  `_layouts/default.html` and load only in production builds, so local
  previews are never counted. The owner chose GoatCounter specifically to
  avoid recording visitor IP addresses.

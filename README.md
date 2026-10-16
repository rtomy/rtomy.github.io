# Rimmy E. Tomy: personal website

This is the source of my academic website, <https://rtomy.github.io>.
GitHub hosts it for free with
[GitHub Pages](https://pages.github.com/) and rebuilds it automatically a minute
or two after any file here changes. There is nothing to install and nothing to
run.

## Where everything is

| To change...                                  | Edit this                    |
| --------------------------------------------- | ---------------------------- |
| The bio on the home page                      | `index.md`                   |
| Papers, abstracts, awards, media on Research  | `_data/research.yml`         |
| Name, title, email, LinkedIn, top menu        | `_config.yml`                |
| PDFs and images (CV, appendices, op-eds)      | the `files` folder           |
| The picture beside a paper                    | its `image:` line in `_data/research.yml` |
| The photo on the home page                    | `photo:` in `_config.yml`    |
| Colors and fonts                              | `assets/css/style.css`       |

The `_layouts` and `_includes` folders hold the page design and rarely need
touching.

## Making a change on github.com

**Edit text** (bio, a paper, settings)

1. Open the file on github.com, for example `_data/research.yml`.
2. Click the pencil icon (**Edit this file**) at the top right of the file.
3. Make the change, then click **Commit changes...** and **Commit changes** again.

**Add a paper.** In `_data/research.yml`, copy an existing paper (everything
from its `- title:` line down to the line before the next `- title:`), paste it
where the new paper should appear, and edit it. The top of that file explains
every field. Two rules matter: keep the spaces at the start of each line lined
up with the lines around it, and keep titles in "double quotes".

**Upload a PDF or image**

1. Open the `files` folder on github.com.
2. Click **Add file** > **Upload files**, drag the file in, and click **Commit changes**.
3. Link to it from `_data/research.yml` as `files/NAME.pdf`.

Uploading a file with the same name as an existing one replaces it.

**Update the CV.** Upload the new PDF to `files` with the name `CV_Tomy.pdf`.
It replaces the old one, and every CV link on the site picks it up.

**Check that it worked.** Open the **Actions** tab of this repository. A green
check next to "pages build and deployment" means the change is live (refresh
the site; on a Mac press Cmd+Shift+R). A red X means something in the edit could
not be read, most often uneven spaces in `_data/research.yml`. GitHub emails
you when that happens, and the site keeps showing the previous version until
the mistake is fixed.

## Making a change with Claude Code

Open Claude Code in this folder and describe the change, for example "add my
new working paper *Title* with Jane Doe, abstract below, PDF attached". Claude
edits the files, shows a preview, and publishes when you approve.

## Previewing on a Mac (optional)

```sh
scripts/preview.sh
```

then open <http://localhost:4000>. The first run downloads the site builder
(a few megabytes). Press Ctrl+C in the terminal to stop the preview.

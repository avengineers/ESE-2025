# Test plan: make the PDF of the German Testing Magazin article

This plan tests the PDF toolchain on a machine that did not use it before:
`scripts/postCreate.sh`, `scripts/generate-pdf.sh` and `scripts/mermaid-filter.lua`. It also
tests that the slides still work, and that Claude Code reads `AGENTS.md`.

All test files go to `out/test_plan/`. Git ignores `out/`.

## What you need

One of these:

- **A local dev container:** Docker, and VS Code with the Dev Containers extension.
- **A GitHub Codespace:** a GitHub account. The machine needs only a browser.

## Prepare

For a local dev container:

1. Clone the repository, and switch to the branch under test. For the first test, that is
   `gtm-article` in the fork:

   ```bash
   git clone https://github.com/xxthunder/ESE-2025.git
   cd ESE-2025
   git switch gtm-article
   code .
   ```

2. In VS Code, run the command **Dev Containers: Reopen in Container**.

For a Codespace:

1. On GitHub, open the branch under test.
2. Select **Code** > **Codespaces** > **Create codespace on** the branch.

For both:

1. Wait until the setup log shows `Post-create setup complete!`.
2. Open a new terminal. Only a new terminal reads the `PATH` that `postCreate.sh` adds to
   `~/.bashrc`.
3. Make the folder for the test files:

   ```bash
   mkdir -p out/test_plan
   ```

## Test cases

### TC-1: The tools are installed

1. Run these commands:

   ```bash
   pandoc --version | head -1
   mmdc --version
   weasyprint --version
   ```

2. Open the Extensions view, and find **Markdown Preview Enhanced**.

Expected result:

- Each command shows a version number. No command shows `command not found`.
- `mmdc --version` shows `11.17.0`, the version that `postCreate.sh` installs. Another
  version can change the layout of the figure in TC-2.
- Markdown Preview Enhanced is installed in the container.

### TC-2: The script makes the PDF

CAUTION: The script replaces the committed `docs/german_testing_magazin/index.pdf`. Step 1
keeps a copy of it.

1. Copy the committed PDF:

   ```bash
   cp docs/german_testing_magazin/index.pdf out/test_plan/index_committed.pdf
   ```

2. Make the PDF:

   ```bash
   bash scripts/generate-pdf.sh; echo "exit=$?"
   ```

3. Open `docs/german_testing_magazin/index.pdf` in a PDF viewer. In a local dev container,
   the file is also in the clone on the host. In a Codespace, right-click the file, and
   select **Download**.

Expected result:

- The output ends with `=== Done: …/index.pdf ===` and `exit=0`. WeasyPrint can show
  warnings about CSS properties. A warning is not a failure.
- The pages are A4. The page number is at the bottom center.
- Figure 1, the flowchart, is in the section "Die Lösung: Unsere SPLE-Plattform". The
  caption "Abbildung 1: …" is centered, in small grey text.
- The emoji in the flowchart show in color, not as empty boxes.
- The headings are dark blue. Each section heading has a thin grey line below it. This
  shows that `style.css` is applied.
- The two author photos show next to their biographies.
- The page count and the layout are the same as in `out/test_plan/index_committed.pdf`.
  Different bytes in the two files are normal.

### TC-3: A relative input path gets the style sheet

An earlier version of the script did not find `style.css` for an input path without a `/`.
It made the PDF without the style, and showed no message.

1. Run the script in the article folder, with a relative input path:

   ```bash
   cd docs/german_testing_magazin
   bash ../../scripts/generate-pdf.sh index.md ../../out/test_plan/tc3.pdf; echo "exit=$?"
   cd ../..
   ```

2. Open `out/test_plan/tc3.pdf`.

Expected result:

- The output ends with `exit=0`.
- The PDF has the same style as in TC-2: dark blue headings, and a grey line below each
  section heading.

### TC-4: A broken diagram stops the script

An earlier version of the Mermaid filter ignored errors from `mmdc`. The script made a PDF
without the figure, and showed no error.

1. Make a copy of the article with a broken diagram:

   ```bash
   sed 's/^flowchart TD$/this is not a diagram/' docs/german_testing_magazin/index.md > out/test_plan/broken.md
   grep -c "this is not a diagram" out/test_plan/broken.md
   ```

   The `grep` command must show `1`. If it shows `0`, the diagram in the article changed.
   Stop, and report it.

2. Run the script on the copy:

   ```bash
   bash scripts/generate-pdf.sh out/test_plan/broken.md; echo "exit=$?"
   ```

3. Look for the PDF of the copy:

   ```bash
   ls out/test_plan/broken.pdf
   ```

Expected result:

- The output shows an error from `mmdc`, and the text `mmdc failed to render mermaid diagram 1`.
- The exit code is not `0`.
- `ls` shows `No such file or directory`. The script did not make `broken.pdf`.

### TC-5: The slides still work

1. Start the development server:

   ```bash
   npm run dev
   ```

2. Open the forwarded port 3000 in the browser.
3. Stop the server with Ctrl+C.

Expected result: the presentation opens, and shows the title slide.

### TC-6: Claude Code reads AGENTS.md

`postCreate.sh` installs Claude Code. `CLAUDE.md` only imports `AGENTS.md`. This test shows
that Claude Code gets the content of `AGENTS.md`.

1. Start Claude Code in the repository root:

   ```bash
   claude
   ```

2. Log in, if Claude Code asks for it.
3. Ask: "Do not read any file. Which folder holds the German Testing Magazin article, and
   which script makes its PDF?"

Expected result: Claude Code answers `docs/german_testing_magazin/` and
`scripts/generate-pdf.sh`, with no tool call. Of the files that Claude Code loads at the
start, only `AGENTS.md` holds this information.

## Clean up

CAUTION: `git restore` discards the new PDF. Do step 1 only if you do not want to commit the
new PDF.

1. Restore the committed PDF:

   ```bash
   git restore docs/german_testing_magazin/index.pdf
   ```

2. Remove the test files:

   ```bash
   rm -rf out/test_plan
   ```

## Report the results

Copy this table into the pull request. Write `pass` or `fail` for each test. For each
failure, add a note and the output of the script.

```markdown
Machine: local dev container | Codespace

| Test | Result | Note |
|---|---|---|
| TC-1 The tools are installed | | |
| TC-2 The script makes the PDF | | |
| TC-3 A relative input path gets the style sheet | | |
| TC-4 A broken diagram stops the script | | |
| TC-5 The slides still work | | |
| TC-6 Claude Code reads AGENTS.md | | |
```

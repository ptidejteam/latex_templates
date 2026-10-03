# Template

Matching Beamer templates for **slides** and **research posters**, with Latin Modern fonts, a shared colour palette, and reusable research blocks.

| I want to make... | Edit | Build | Open |
| --- | --- | --- | --- |
| A presentation | `slides.tex` | `make slides` | `slides.pdf` |
| A portrait poster | `poster.tex` | `make poster` | `poster.pdf` |

**Slides:** the PDF is a visual tutorial. Find a slide you like, search for its title in `slides.tex`, copy its frame, and edit the content. Remove the tutorial frames you do not need.

**Poster:** the two-column PDF is also a visual tutorial. Find a block you like, search for its title in `poster.tex`, and copy its LaTeX example or complete `colorblock`. The poster itself explains the header, paper sizes, figures, tables, colours, and shared styling. Replace the guide blocks with your research; the header appears automatically and all content stays in one frame.

## Overleaf

Upload both `.tex` files, all three `.sty` files, and the assets you use. In the project settings, select **`slides.tex`** or **`poster.tex`** as the main document and **pdfLaTeX** as the compiler. The packages are available in Overleaf's TeX Live environment; the Makefile and VS Code tasks are only for local builds.

Both sources use optional logos from `assets/logos/`. Replace the paths in `\titlegraphic` with your own PNG, JPG, or PDF images. Missing files are skipped; remove the poster's `\titlegraphic` block to omit its logo row entirely. Prefer vector PDFs or high-resolution originals for print logos and figures. Grey figure placeholders are drawn by LaTeX, so no example image downloads are needed.

## Build locally or in VS Code

With Make and pdfLaTeX installed:

```sh
make          # Both templates
make slides   # Presentation only
make poster   # Poster only
make clean-aux # Remove auxiliary files; keep PDFs
make clean     # Remove all generated files, including PDFs
```

PDFs, logs, and auxiliary files stay in the repository root. In VS Code, **Cmd+Shift+B** (macOS) or **Ctrl+Shift+B** (Windows/Linux) builds both templates. **Terminal > Run Build Task** also offers individual slide and poster tasks. No editor extension is required; existing LaTeX extensions can compile either source directly. Check `slides.log` or `poster.log` if compilation fails.

Without Make, compile your chosen source twice:

```sh
pdflatex -interaction=nonstopmode -halt-on-error poster.tex
pdflatex -interaction=nonstopmode -halt-on-error poster.tex
```

Replace `poster.tex` with `slides.tex` for slides. Required packages are Beamer, Latin Modern, booktabs, and listings; the poster also uses **beamerposter** (including its `type1cm`, `fp`, and `xkeyval` dependencies). Install missing packages through your TeX distribution's package manager. No shell escape, external code highlighter, or bibliography processor is needed.

## A0 or A1 poster

At the top of `poster.tex`:

```latex
\usepackage[orientation=portrait,size=a0,scale=1.2]{beamerposter}
```

Change only `size=a0` to `size=a1` and rebuild:

| Setting | Portrait PDF size |
| --- | --- |
| `size=a0` (default) | 841 × 1189 mm |
| `size=a1` | 594 × 841 mm |

Both use the same two-column layout. Fonts and spacing scale with the page; keep `scale=1.2` for the supplied design. These are the two supported and checked poster sizes. Print at **actual size / 100%** on the matching paper. Review both sizes after substantial content changes, and shorten overflowing content before shrinking the text.

## Where to edit the template

| File | Purpose |
| --- | --- |
| `slides.tex` | Slide content, visual tutorial, and copyable examples. |
| `poster.tex` | Poster visual tutorial, size selector, and copyable examples. |
| `beamerCommon.sty` | Shared colours, fonts, blocks, code highlighting, and helpers. |
| `beamerthemeTemplate.sty` | Slide margins, cover, headings, and page count. |
| `beamerthemeTemplatePoster.sty` | Poster header, scaled typography, margins, and column spacing. |
| `assets/logos/` | Example logos; replace with your own. |
| `Makefile` / `.vscode/tasks.json` | Local builds. |

Change shared styling once in `beamerCommon.sty` to affect both templates. Layout-specific settings stay in their respective themes. The poster theme's first section holds its margin, column-gap, and block-gap settings; the equal column widths are derived from them. For a separate slide-only project, keep `slides.tex`, `beamerCommon.sty`, `beamerthemeTemplate.sty`, and your assets; for poster-only, use `poster.tex`, `beamerCommon.sty`, `beamerthemeTemplatePoster.sty`, and your assets.

## Research blocks

The same environment works in both templates:

```latex
\begin{colorblock}[orange]{Research gap}
  Describe what is missing.
\end{colorblock}
```

| Colour parameter | Hex | Use |
| --- | --- | --- |
| `orange` | `#DA3A16` | Problems and research gaps. |
| `turquoise` | `#057D78` | Solutions and answers to research questions. |
| `darkblue` | `#004085` | Research questions and goals. |
| `burgundy` (default) | `#7A003C` | Highlights, key findings, takeaways, and conclusions. |

Write `\begin{colorblock}{Key finding}` for the default. Both templates also share `\takeaway{...}`, `\source{...}`, `\metric{value}{label}`, and `\figureplaceholder[height]{label}`. For a real figure, replace the placeholder with `\includegraphics[width=\linewidth]{assets/your-figure.pdf}`. See `slides.tex` for more examples, including highlighted code with line numbers.

Burgundy retains the original template colour. Orange, turquoise, and dark blue come from the [Concordia web palette](https://www.concordia.ca/web/design/ui-kit-style-guide-accessibility/web-palette-new.html); the research categories are this template's convention.

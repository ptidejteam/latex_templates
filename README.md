# Template

Matching Beamer slides and research posters with shared fonts, colours, logos, and research blocks.

| Document | Source | Local build | Output |
| --- | --- | --- | --- |
| Slides | `slides.tex` | `make slides` | `slides.pdf` |
| Poster | `poster.tex` | `make poster` | `poster.pdf` |

## Compile locally

Install a TeX distribution with pdfLaTeX, Beamer, Latin Modern, booktabs, listings, and beamerposter. SVG logos also require the LaTeX `svg` package and Inkscape on your command path. From the project directory, run `make` to build both documents, or use the commands above. Without Make, run pdfLaTeX twice on the selected source:

```sh
pdflatex -shell-escape -interaction=nonstopmode -halt-on-error poster.tex
pdflatex -shell-escape -interaction=nonstopmode -halt-on-error poster.tex
```

Use `slides.tex` for slides. Outputs stay in the project directory. `make clean-aux` removes auxiliary files; `make clean` also removes the generated PDFs. The Makefile enables shell escape for automatic SVG conversion. No external code highlighter is required.

## Overleaf

Upload the `.tex` and `.sty` files and your assets. Select `slides.tex` or `poster.tex` as the main document and **pdfLaTeX** as the compiler.

## Edit the content

The slide PDF is a visual guide: copy a frame from `slides.tex` and replace its content. Remove tutorial frames you do not need.

The poster uses two kinds of block. Ordinary `colorblock` blocks fill one column and appear two per row, in source order. Add `*` to make a block span both columns:

```latex
\begin{colorblock*}{4. Visual overview}
  \begin{figure}
    \includegraphics[width=\linewidth]{assets/your-figure.pdf}
    \caption{Your caption.}
  \end{figure}
\end{colorblock*}
```

Only a block spans columns. Its text, figures, and tables share its content width; use `\linewidth` to size an image or table to that width. Keep figures and tables inside their block. A starred block starts a full-width row, and the following ordinary blocks resume two-column rows automatically. No column environments or poster-width calculations are needed in `poster.tex`.

Both block types accept an optional colour: `\begin{colorblock*}[turquoise]{Title}`. The choices are `burgundy` (default, highlights), `orange` (research gaps), `turquoise` (answers), and `darkblue` (research questions). Helpers include `\figureplaceholder[height]{label}`, `\source{credit}`, `\takeaway{text}`, and `\metric{value}{label}`.

## Logos and poster size

Set the three logo paths in `\titlegraphic` using `\logobar[height]{concordia}{gina-cody}{conference}`. The bar reserves 25%, 25%, and 50% of its width, with left, left, and right alignment. Missing logo files are skipped. Each slot accepts PDF, SVG, PNG, or JPG, and formats can be mixed. SVGs are converted automatically with Inkscape; local SVG builds need `-shell-escape` (already enabled by `make`). See `assets/logos/README.md` for the supplied assets.

The poster defaults to portrait A0. Change `size=a0` to `size=a1` in `poster.tex` for A1; keep `scale=1.32`. Print at actual size and review the layout after content changes.

| File | Purpose |
| --- | --- |
| `beamerCommon.sty` | Shared colours, fonts, logo bar, blocks, and helpers. |
| `beamerthemeTemplate.sty` | Slide layout. |
| `beamerthemeTemplatePoster.sty` | Poster layout and starred blocks. |

Burgundy is the original template colour. Other accents come from the [Concordia web palette](https://www.concordia.ca/web/design/ui-kit-style-guide-accessibility/web-palette-new.html).

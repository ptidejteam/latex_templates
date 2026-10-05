# Logo assets

| File | Purpose |
| --- | --- |
| `concordia_logo.svg` | Downloaded Concordia original, preserved unchanged. |
| `concordia_logo.pdf` | Tightly cropped vector export used by both templates. |
| `gina_cody-text.svg` | Editable three-line text reconstruction using Gill Sans Regular and SemiBold. |
| `gina_cody-wordmark.svg` | Outlined vector version of that text; no fonts required. |
| `gina_cody-wordmark.pdf` | Vector PDF used by both templates. |
| `conference_logo.svg` | Editable conference-logo placeholder. |
| `conference_logo.pdf` | Cropped vector PDF with outlined text, used by both templates. |

The Gina Cody reconstruction approximates the supplied reference, it is not an official master. Its text, sizes, tracking, and colours are independent of the presentation theme. Edit `gina_cody-text.svg` in Inkscape or a text editor. Gill Sans must be installed when regenerating the outlines. The outlined SVG and PDF are portable and do not require that font.

Both templates use `\logobar[height]{concordia}{gina-cody}{conference}` inside `\titlegraphic`. The bar reserves 25%, 25%, and 50% respectively, with left, left, and right alignment. Change the paths in the `.tex` file; layout settings live in `beamerCommon.sty`.

## Regenerate after editing

From the repository root, with Inkscape available on your command line:

```sh
inkscape assets/logos/gina_cody-text.svg --export-text-to-path --export-plain-svg --export-area-drawing --export-filename=assets/logos/gina_cody-wordmark.svg
inkscape assets/logos/gina_cody-wordmark.svg --export-area-drawing --export-filename=assets/logos/gina_cody-wordmark.pdf
inkscape assets/logos/concordia_logo.svg --export-area-drawing --export-filename=assets/logos/concordia_logo.pdf
inkscape assets/logos/conference_logo.svg --export-text-to-path --export-area-drawing --export-filename=assets/logos/conference_logo.pdf
```

The templates include the ready-made vector PDFs because pdfLaTeX does not read SVG directly. This preserves sharp vectors without adding an SVG converter, shell escape, or fonts to the normal build. Upload these PDFs with the project to Overleaf. `make clean` removes generated documents in the root, not these logo assets.

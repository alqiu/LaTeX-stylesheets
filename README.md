# LaTeX-stylesheets
Custom LaTeX stylesheets.

- aq-cv.cls: Template for CV.
- aq-hw.cls: Template for homework.
- aq-notes.cls: Template for notes. Also suitable for papers.

To use, place the desired stylesheet in the same directory as the main .tex file and make sure the .tex file starts with
```
\documentclass[options]{stylesheet-name}
```
Currently, all stylesheets are based on the `article` document class, so any options from article should also work with these stylesheets.
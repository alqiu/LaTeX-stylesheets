# LaTeX-stylesheets
Custom LaTeX stylesheets. To use, place the desired stylesheet in the same directory as the main .tex file. If using Overleaf, this means upload the stylesheet to the project. Make sure that the .tex file starts with
```
\documentclass[options]{stylesheet-name}
```

These are all works in progress!

## Common features of each stylesheet

- Based on the `article` document class, so any options from article should also work with these stylesheets.
- Uses Latin Modern with T1 font encoding and UTF8 input encoding.
- Various basic packages for math, figures, hyperlinks, etc.
- Margins set to 1 inch on all sides.

## aq-cv.cls

Template for CV.

- Provides macros to set user information (e.g. name, email, website).
- Uses `titlesec` package to put section headers in their own column.

## aq-hw.cls

Template for homework.

- Predefined amstheorem environments, like `definition`, `theorem`, `proposition`, etc.

## aq-notes.cls

Template for lecture notes. Also suitable for papers.

- Predefined amstheorem environments, like `definition`, `theorem`, `proposition`, etc.
#!/usr/bin/env bash
set -e

JOB=RamunasGirdziusasResume
SRC=rgresume.tex

# 1) First XeLaTeX → .aux & .bcf
xelatex -interaction=nonstopmode -jobname="$JOB" "$SRC"

# 2) Biber → .bbl
#biber "$JOB"

# 3) Two more XeLaTeX passes
xelatex -interaction=nonstopmode -jobname="$JOB" "$SRC"
xelatex -interaction=nonstopmode -jobname="$JOB" "$SRC"

# 4) Clean up intermediate files *and* .bbl
latexmk -c -jobname="$JOB" "$SRC"
rm -f "${JOB}.bbl" "${JOB}.bcf" "${JOB}.run.xml"

# 5) Open the PDF
evince "${JOB}.pdf" &


latex rgcv.tex

bibtex rgcv

latex rgcv.tex

latex rgcv.tex

dvips -t a4 -Ppdf -G0 -o rgcv.ps rgcv.dvi

ps2pdf rgcv.ps
ps2pdf -dPDFSETTINGS=/prepress \
       -dCompatibilityLevel=1.3 \
       -dAutoFilterColorImages=false \
       -dAutoFilterGrayImages=false \
       -dColorImageFilter=/FlateEncode \
       -dGrayImageFilter=/FlateEncode \
       -dMonoImageFilter=/FlateEncode \
       -dDownsampleColorImages=false \
       -dDownsampleGrayImages=false \
       rgcv.ps RamunasGirdziusasCV.pdf

rm  *.aux *.log *.bbl *.blg *.out *.dvi *.ps

evince RamunasGirdziusasCV.pdf

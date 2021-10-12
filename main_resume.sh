latex rgresume.tex

latex rgresume.tex

latex rgresume.tex

dvips -t a4 -Ppdf -G0 -o rgresume.ps rgresume.dvi

ps2pdf rgresume.ps
ps2pdf -dPDFSETTINGS=/prepress \
       -dCompatibilityLevel=1.3 \
       -dAutoFilterColorImages=false \
       -dAutoFilterGrayImages=false \
       -dColorImageFilter=/FlateEncode \
       -dGrayImageFilter=/FlateEncode \
       -dMonoImageFilter=/FlateEncode \
       -dDownsampleColorImages=false \
       -dDownsampleGrayImages=false \
       rgresume.ps RamunasGirdziusasResume.pdf

rm  *.aux *.log *.out *.dvi *.ps

evince RamunasGirdziusasResume.pdf

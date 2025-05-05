## Introduction

These are the LaTeX files for my résumé and curriculum vitae (cv).

They could be useful for someone having text with a lot of links (urls). The LaTeX code includes macros needed to break/wrap urls and do the same with urls inside .bib refs. This problem is tricky, just like in the HTML/CSS domain. The code hides the protocol part (`http://` and `https://`) while preserving the url. One can also see how to use nonstandard fonts.

To modify LaTeX, install XeLaTeX (Ubuntu 22.04). This is more arduous than expected due to Ubuntu/Debian meta-packages pulling in a broken ConTeXt format builder. One needs to resort to official TeX Live’s tlmgr with a custom profile as ChatGPT shows after a few iterations by trial and error.

## XeLaTeX

```console
sudo apt purge --auto-remove 'texlive-*' 'context' 'luatex*' 'biber' 'latexmk'
sudo rm -rf /usr/share/texlive /etc/texmf /var/lib/texmf ~/.texlive* ~/.texmf-var
sudo apt update
cd /tmp
wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar xzf install-tl-unx.tar.gz
cd install-tl-20*
```

```console
touch myprofile.profile
gedit myprofile.profile
```

Add the following to myprofile.profile:

```txt
selected_scheme scheme-full
TEXDIR /usr/local/texlive/2025
TEXMFCONFIG ~/.texlive2025/texmf-config
TEXMFHOME   ~/texmf
TEXMFVAR    ~/.texlive2025/texmf-var
binary_x86_64-linux 1
```

Install the whole texlive-full:

```console
sudo ./install-tl -profile myprofile.profile
```

This may take 45 minutes.

Finally, add paths to .bashrc and restart the terminal:

```bash
export PATH=/usr/local/texlive/2025/bin/x86_64-linux:$PATH
export MANPATH=/usr/local/texlive/2025/texmf-dist/doc/man:$MANPATH
export INFOPATH=/usr/local/texlive/2025/texmf-dist/doc/info:$INFOPATH
```

Verify:

```console
which xelatex      
/usr/local/texlive/2025/bin/x86_64-linux/xelatex

xelatex --version
XeTeX 3.141592653-2.6-0.999997 (TeX Live 2025)
kpathsea version 6.4.1
Copyright 2025 SIL International, Jonathan Kew and Khaled Hosny

which biber        
/usr/local/texlive/2025/bin/x86_64-linux/biber

kpsewhich biblatex.sty
/usr/local/texlive/2025/texmf-dist/tex/latex/biblatex/biblatex.sty
```

Workflow:

```console
./main_cv.sh
./main_resume.sh
```

## Fonts (Optional)

Inter is a sans-serif typeface, considered to be a modern and less academic font, alternative to [Helvetica](https://workspace.digital/why-you-should-care-about-fonts/#:~:text=Now%2C%20the%20differences%20between%20Times,means%20it%20lacks%20those%20flourishes.). It covers Latin and Cyrillic.

```console
sudo apt install fonts-inter
sudo fc-cache -f -v
```

I also use a monospaced font Source Code Pro which will be picked up by urls inside LaTeX, or one can apply it with `\texttt{...}` or `{\ttfamily ... }`. I would use such a font everywhere, but it is incredibly uneconomic space-wise, so it is only in my one-page resume and urls.

It requires a different method as no system package exists on Ubuntu 22.04.

Firstly, run

```console
sudo visudo
```

and add /usr/local/texlive/2025/bin/x86_64-linux to the Defaults secure_path="…" line. This is to make `sudo tlmgr` work directly without its long path.

```console
sudo tlmgr update --self
sudo tlmgr install sourcecodepro
```

To get the font file names, do `ls` and use what you need (see LaTeX): 

```console
ls /usr/local/texlive/2025/texmf-dist/fonts/opentype/adobe/sourcecodepro/
SourceCodePro-BlackIt.otf       SourceCodePro-ExtraLight.otf  SourceCodePro-RegularIt.otf
SourceCodePro-Black.otf         SourceCodePro-LightIt.otf     SourceCodePro-Regular.otf
SourceCodePro-BoldIt.otf        SourceCodePro-Light.otf       SourceCodePro-SemiboldIt.otf
SourceCodePro-Bold.otf          SourceCodePro-MediumIt.otf    SourceCodePro-Semibold.otf
SourceCodePro-ExtraLightIt.otf  SourceCodePro-Medium.otf
```

Verify font embedding:

```console
pdffonts RamunasGirdziusasCV.pdf
name                                 type              encoding         emb sub uni object ID
------------------------------------ ----------------- ---------------- --- --- --- ---------
ZSEALP+Inter-ExtraBold-Identity-H    CID Type 0C       Identity-H       yes yes yes      4  0
XZIGBV+Inter-Regular-Identity-H      CID Type 0C       Identity-H       yes yes yes      6  0
EAJKBH+SourceCodePro-Regular-Identity-H CID Type 0C       Identity-H       yes yes yes      8  0
TZRMKM+Inter-Italic-Identity-H       CID Type 0C       Identity-H       yes yes yes     13  0
```

```console
pdffonts RamunasGirdziusasResume.pdf
name                                 type              encoding         emb sub uni object ID
------------------------------------ ----------------- ---------------- --- --- --- ---------
ARICNX+SourceCodePro-Bold-Identity-H CID Type 0C       Identity-H       yes yes yes      4  0
IQZUPS+SourceCodePro-Regular-Identity-H CID Type 0C       Identity-H       yes yes yes      6  0
VUKQIA+LMMono12-Regular-Identity-H   CID Type 0C       Identity-H       yes yes yes      8  0
```

## Acknowledgements

I learned LaTeX from D.Sc. Jorma Laaksonen who was my thesis instructor at Helsinki University of Technology (HUT, TKK, Aalto University), 1999-2008.

The July 17 2024 commit "Evgenia Berkovich and Svetlana Petrijchuk" corresponds to the old way of doing LaTeX with babel, fontenc, bibtex, and "latex -> dvi -> ps -> ps2pdf" pipeline. Line breaking and alignment is manual and tied to a fixed page geometry. The bash scripts were given to me by ‪Davide Eynard (USI, Twitter) in 2014. 

The latest commit "major revamp" (April 30, 2025) uses the modern way: XeLaTeX with biber, via ChatGPT, mostly. This is a fully automated layout with text inside .tex, .bib and urls properly wrapping or splitting, which is the problem that will hardly ever be solved perfectly.

ChatGPT, DeepSeek, and Grok are enormously helpful. I cannot imagine myself doing LaTeX macros and endless improvements without the AI.

>"True automatic detection of a “soft wrap” in TeX and insertion of a leading “│” on every continuation line is essentially impossible in standard LaTeX. TeX doesn’t expose its line-breaking decisions at the macro level, so there’s no hook you can attach to say “when you wrap here, insert a symbol.” Any solution that pretends to do that is already doing its own wrapping under the hood."
>
> - ChatGPT, May 5, 2025


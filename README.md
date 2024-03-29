## Setup

These are the LaTeX files for my résumé and curriculum vitae (cv).

If you want to modify them, you first need to install [LaTeX](https://linuxconfig.org/how-to-install-latex-on-ubuntu-22-04-jammy-jellyfish-linux):

```console
sudo apt install texlive-latex-extra
sudo apt install texlive-fonts-extra
./main_cv.sh
./main_resume.sh
```

This will take about 2GB of the HDD space.

## Acknowledgements

I learned LaTeX in the years 1999-2008 mostly from D. Sc. Jorma Laaksonen who was my thesis instructor at Helsinki University of Technology (HUT, TKK, Aalto University), and I still used it heavily around 2012 and 2014.

The shell scripts were given to me by ‪Davide Eynard.

## Observation

The LaTeX+TikZ+Beamer way of writing documents is very solid, but also tedious. It is better to be less pedantic and write directly in Markdown unless it is a math paper or a thesis. Markdown is good enough, instant publishing with github, Google fonts, can easily update and remove things, no paywalls, better search (?), diagramming with Mermaid or [app.diagrams.net/](https://app.diagrams.net/).

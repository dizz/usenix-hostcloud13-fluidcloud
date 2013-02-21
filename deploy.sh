#!/bin/sh
case "$1" in
  pdf)
	rm -rf temp
	mkdir temp

	cp -r img temp/img
	cp *.sty temp
	touch temp/out.md

	cat paper.md >> temp/out.md
	# tail -n +4 apps.md >> temp/out.md

	cd temp
	/home/tmetsch/data/workspace/peg-multimarkdown/multimarkdown -t latex out.md > out.tex

	echo '\documentclass[letterpaper,twocolumn,10pt]{article}
\usepackage{usenix,epsfig,endnotes}
\\begin{document}
\date{}
\\title{\Large \\bf FluidCloud}
\\author{
{\\rm Your N.\ Here}\\
Your Institution
} % end author
\\maketitle
% Use the following at camera-ready time to suppress page numbers.
% Comment it out when you first submit the paper for review.
\\thispagestyle{empty}
' | cat - out.tex > /tmp/out && mv /tmp/out out.tex

	# sed -i 's/\[htbp\]/\[H\]/g' ./thesis.tex
	echo '\\end{document}' >> out.tex

	pdflatex -interaction=nonstopmode out.tex
	pdflatex -interaction=nonstopmode out.tex
	pdflatex -interaction=nonstopmode out.tex
	cp out.pdf ..
	cd ..
    ;;
  html)
    rm -rf web
    mkdir web
    /home/tmetsch/data/workspace/peg-multimarkdown/multimarkdown -b *.md
    cp -r img/ web/img
    cp style.css web/
    mv *.html web/
    ;;
  *)
    echo "Usage: $N {pdf,html}"
    exit 1
    ;;
esac

exit 0

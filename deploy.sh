#!/bin/sh
case "$1" in
  pdf)
	rm -rf temp
	mkdir temp

	cp -r img temp/img
	cp *.sty temp
	touch temp/out.md

	cat fluidcloud.md >> temp/out.md
	# tail -n +4 apps.md >> temp/out.md

	cd temp
	multimarkdown -t latex out.md > out.tex

	cat ../header.tex | cat - out.tex > /tmp/out && mv /tmp/out out.tex

	# sed -i 's/\[htbp\]/\[H\]/g' ./thesis.tex
	cat  ../footer.tex >> out.tex

	pdflatex -interaction=nonstopmode out.tex
	pdflatex -interaction=nonstopmode out.tex
	pdflatex -interaction=nonstopmode out.tex
	cp out.pdf ..
	cd ..
    ;;
  html)
    rm -rf web
    mkdir web
    multimarkdown -b *.md
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

#!/bin/sh
COMMAND="latexmk -xelatex -cd -interaction=nonstopmode -file-line-error -jobname=main_summary -outdir=../build ./src/main_summary.tex ; 
    latexmk -xelatex -cd -interaction=nonstopmode -file-line-error -jobname=main_cheatsheet -outdir=../build ./src/main_cheatsheet.tex ;
    latexmk -xelatex -cd -interaction=nonstopmode -file-line-error -jobname=main -outdir=../build ./src/main.tex"
exec docker run --rm -i --user="$(id -u):$(id -g)" --net=none --env HOME=../build -v "$PWD":/usr/src/app -w /usr/src/app texlive/texlive:latest sh  -c "$COMMAND"
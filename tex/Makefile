# #########################
# FILE = puppetcamp2014
2014.tex
#########################

.SUFFIXES:      .tex .dvi .ps .eps .pdf

DVIFILE = $(FILE).dvi
PSFILE = $(FILE).ps
PDFFILE = $(FILE).pdf

TEX = latex
DVIPS = dvips
DVIOPT= -Ppdf -f
PS2PDF = ps2pdf14

PDFFILES := $(patsubst %.eps,%.pdf,$(wildcard *.eps))

all: $(PDFFILES)

.PHONY: pdf
pdf: nomencl
        pdflatex $(FILE).tex

.PHONY: cleanpdf
cleanpdf:
        rm $(PDFFILES)

.PHONY: nomencl
nomencl:
        makeindex $(FILE).nlo -s nomencl.ist -o $(FILE).nls

.PHONY: clean
clean:
        rm -rf *~ *.*~ *.log *.aux *.dvi *.idx *.toc *.ps *.out

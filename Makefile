NAME=msbr-reproc
AUX=$(NAME).aux acros.aux
INTERMEDIATES=$(NAME).bbl $(NAME).blg $(NAME).log $(NAME).out $(NAME).alg $(NAME).acn $(NAME).gls $(NAME).ist $(NAME).glg $(NAME).glo $(NAME).acr

all: $(NAME).pdf

$(NAME).pdf : $(NAME).tex
	pdflatex -shell-escape $(NAME)
	bibtex $(NAME)
	makeglossaries $(NAME)
	pdflatex -shell-escape $(NAME)
	pdflatex -shell-escape $(NAME)

clean :
	rm $(AUX) $(INTERMEDIATES)

clobber :
	rm $(NAME).pdf

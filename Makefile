all:
	#'paper' is the name of your main tex file.
	pdflatex paper
	bibtex paper
	pdflatex paper
	pdflatex paper
	
clean:
	rm *.log *.aux *.bbl *.blg *.dvi

diff:
	latexdiff --flatten ../OTHER/Paper.tex Paper.tex > Paper-diff.tex
	pdflatex Paper-diff
	bibtex Paper-diff
	pdflatex Paper-diff
	pdflatex Paper-diff

flat:
	latexpand Paper.tex > Paper-flat.tex

ps:
	pdf2ps paper.pdf paper.ps

camera:
	#
	# Build the PDF
	pdflatex paper
	bibtex paper
	pdflatex paper
	pdflatex paper
	#
	# Magic to embed the fonts correctly. Create a new pdf in the
	# directory for camera ready files. Make sure to run pdffonts to check
	# if the fonts are actually embedded.
	ps2pdf -dPDFSETTINGS=/prepress paper.pdf ./CamFiles/paper_cam.pdf
	#
	# Get the source, flatten to one file, and remove comments.
	latexpand Paper.tex > CamFiles/paper_cam.tex
	#
	# Make the PS file
	pdf2ps CamFiles/paper_cam.pdf CamFiles/paper_cam.ps




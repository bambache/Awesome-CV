.PHONY: examples

CC = xelatex
EXAMPLES_DIR = examples
FB_DIR = florin.balate

RESUME_DIR = examples/resume

CV_DIR = examples/cv
FB_CV_DIR =  florin.balate/cv

RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')

CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')
FB_CV_SRCS = $(shell find $(FB_CV_DIR) -name '*.tex')

# examples: $(foreach x, coverletter cv resume, $x.pdf)
florin.balate: $(foreach x, fb.coverletter fb.cv,  $x.pdf)

resume.pdf: $(EXAMPLES_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

cv.pdf: $(EXAMPLES_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

coverletter.pdf: $(EXAMPLES_DIR)/coverletter.tex
	$(CC) -output-directory=$(EXAMPLES_DIR) $<

fb.cv.pdf: $(FB_DIR)/cv.tex $(FB_CV_SRCS)
	$(CC) -output-directory=$(FB_DIR) $<

fb.coverletter.pdf: $(FB_DIR)/coverletter.tex
	$(CC) -output-directory=$(FB_DIR) $<

clean:
	rm -rf $(EXAMPLES_DIR)/*.pdf
	rm -rf $(FB_DIR)/*.pdf

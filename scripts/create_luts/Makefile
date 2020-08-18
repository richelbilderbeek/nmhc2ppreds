# Creates all the LUTs on Peregrine.
#
# Usage:
#
#   make
#

all:
	Rscript create_luts.R

zip:
	zip luts.zip *.csv *.log *.R Makefile *.sh

clean:
	rm -f *.png *.pdf *.log *.png *.csv


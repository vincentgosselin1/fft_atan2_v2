#
# Count the number of lines in a text file
#
set infile [open "input.txt" r]
set outfile [open "output.txt" w]
set number 0

#
# gets with two arguments returns the length of the line,
# -1 if the end of the file is found
#
while { [gets $infile line] >= 0 } {
    incr number
	set val [expr $line + 32767]
	puts $outfile $val
	
	
}
close $infile


close $outfile
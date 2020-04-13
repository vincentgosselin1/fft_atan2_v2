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
   	
	set val $line

	#if number is positive keep it
	if {$val >= 0} {
		#do nothing
	} else {
		set val [expr $val + 65536]
	}

	# "-0 bug"
	if {$val == -0} {
		set val 0
	}
	
	puts $outfile $val
	
	
}
close $infile


close $outfile
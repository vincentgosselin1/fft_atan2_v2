#decimal_to_binary_python by Vincent Gosselin, 2020.

print("\n\ndecimal_to_binary_python by Vincent Gosselin, 2020\n\n");
#imports
import time

# Open a file
fo = open("input.txt", "r")
fw = open("output.txt", "w+")
print ("Name of the file: ", fo.name)
print ("Name of the file: ", fw.name)


# Assuming file has following 5 lines
# This is 1st line
# This is 2nd line
# This is 3rd line
# This is 4th line
# This is 5th line

def bindigits(n, bits):
    s = bin(n & int("1"*bits, 2))[2:]
    return ("{0:0>%s}" % (bits)).format(s)

line = "aa"
while line != "":
	print("loopingggg")
	line = fo.readline();
	#line
	#line.strip("\n");
	data = line.strip("\n");
	val = int(data);

	value1 = val + 32768;


	#fw.write( "Python is a great language.\nYeah its great!!\n")
	fw.write(value1)
	fw.write("\n")

		

# Close opend files
fo.close()
fw.close()

#bin(4984,16)
time.sleep(1000)
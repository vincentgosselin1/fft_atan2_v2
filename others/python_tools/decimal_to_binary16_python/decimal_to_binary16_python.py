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

line = "aa"
while line != "":
	print("loopingggg")
	line = fo.readline();
	line
	#line.strip("\n");

	data = line.strip("\n");
	data
	#value input from text file
	#val = 4096;
	stringgg = data;
	stringgg
	val = int(stringgg);
	val
	type(val)
	print("val is decimal is", val);
	value = '{0:016b}'.format(val)
	print("value is binary is", value);

	#fw.write( "Python is a great language.\nYeah its great!!\n")
	fw.write(value)
	fw.write("\n")

		

# Close opend files
fo.close()
fw.close()

#bin(4984,16)
time.sleep(1000)
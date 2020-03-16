#binary16_to_testbench_commands by Vincent Gosselin, 2020.

print("\n\nbinary16_to_testbench_commands by Vincent Gosselin, 2020\n\n");
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
	if line == "":	
		break;
	#line.strip("\n");

	data = line.strip("\n");
	data

	#fw.write( "Python is a great language.\nYeah its great!!\n")
	
	#string will be
	#real <= "1000000000000000";
	#wait for 5 ns;
	
	#real <= "1000000000000000";
	fw.write("real <= \"")
	fw.write(data)
	fw.write("\";\n")
	fw.write("wait for 5 ns;\n")

		

# Close opend files
fo.close()
fw.close()

#bin(4984,16)
print("done")
#time.sleep(1000)
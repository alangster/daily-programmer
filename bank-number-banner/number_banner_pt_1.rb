# Need to write a program that takes in a string of digits and represents them as such:
#    _   _       _   _  _   _   _   _
# |  _|  _| |_| |_  |_   | |_| |_| | |
# | |_   _|   |  _| |_|  | |_|  _| |_|

# Make a hash that itself contains three arrays
# Each of the internal hashes contains part (top, middle, or bottom) of a digit's representation


BANNER_HASH = {
	:line_one =>   [" _ ", "   ", " _ ", " _ ", "   ", " _ ", " _ ", " _ ", " _ ", " _ ",],
	:line_two =>   ["| |", " | ", " _|", " _|", "|_|", "|_ ", "|_ ", "  |", "|_|", "|_|"],
	:line_three => ["|_|", " | ", "|_ ", " _|", "  |", " _|", "|_|", "  |", "|_|", " _|"] 
}

# start w/ three empty strings, then add the necessary pipes/underscores by accessing the index
# of each line's array specified by the input

def to_banner(num)
	output = ["", "", ""]
	BANNER_HASH.each_value.with_index do |val, i|
		output[i] += val[num] + " "
	end
	output
end

def assemble(num_array)
	lines = ["", "", ""]
	num_array.each do |num|
		output = to_banner(num)
		lines.map!.with_index {|str, i| str += output[i] }
	end
	puts lines
end

assemble(ARGV[0].chars.map(&:to_i))

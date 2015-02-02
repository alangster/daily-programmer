# Now, need to be able to translate the banner numbers back into their original digits

# I'll assume that the lines come in with only a \n separating them
# So, I'll start by splitting each line into 4-character pieces, because each line of each digit was made of three
# characters (space, pipe, or underscore) plus a trailing space
# Having split each line into 4-character pieces, I'll drop the trailing spaces
# Then, with my 3-character chunks, I'll group the chunks as they were initially, then use that to determine 
# which digit they represent

BANNER_ARR = [
   [" _ ", "   ", " _ ", " _ ", "   ", " _ ", " _ ", " _ ", " _ ", " _ ",],
   ["| |", " | ", " _|", " _|", "|_|", "|_ ", "|_ ", "  |", "|_|", "|_|"],
	 ["|_|", " | ", "|_ ", " _|", "  |", " _|", "|_|", "  |", "|_|", " _|"] 
]

def decipher(chunk_arr)
	possible_nums = Array(0..9)
	chunk_arr.each.with_index do |chunk, i|
		possible_nums = possible_nums & BANNER_ARR[i].map.with_index {|segment, i| i if segment == chunk}
		break if possible_nums.count == 1
	end
	possible_nums[0]

end

def make_segments(input_arr)
	segments_array = input_arr.map {|str| str.scan(/[_\|\s]{4}/).map(&:chop)}
	(0..(segments_array[0].count - 1)).map do |place|
		segments_array.map {|seg| seg[place]}
	end
end

def translate(input)
	make_segments(input).map {|chunk| decipher(chunk)}.join
end

input = ["     _   _   _   _   _   _       _  ",
				 "|_| |_| | | | | |_    |   |  |  |_  ",
				 "  |  _| |_| |_| |_|   |   |  |   _| "]

puts translate(input)


def encode(lines, text)
	segments, list = set_up(text.length, lines.to_i)

	text.chars.each.with_index do |char, ind|
		segments[list[ind]] << char
	end

	segments.join
end

def decode(lines, text)
	segments, list = set_up(text.length, lines.to_i)

	list.each {|num| segments[num] << num}
	text_ind = 0
	code = segments.map { |arr| text[text_ind...(text_ind += arr.count)].chars }

	list.inject("") {|res, num| res += code[num].shift}
end

def set_up(length, count)
	[Array.new(count.to_i) { Array.new }, range_snake(length, count)]
end

def range_snake(length, count)
	range = []
	until range.count >= length 
		0.upto(count - 1) { |num| range << num } && (count - 2).downto(1) { |num| range << num }
	end
	range.first(length)
end

input = ARGF.argv
puts input[0] == 'enc' ? encode(*input.last(2)) : decode(*input.last(2))

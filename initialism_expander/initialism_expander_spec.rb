require_relative 'initialism_expander'

describe Expander do 

	before do
		@ex = Expander.new
	end

	describe '#filter' do

		context 'valid initialism' do
			
			context 'one initialism as input' do  
				it 'returns the expanded phrase' do
					expect(@ex.filter('lol')).to eq('laugh out loud')
				end
			end

			context 'sentence with one initialism' do
				it 'returns sentence and expanded phrase' do
					expect(@ex.filter('oh man, wtf?')).to eq('oh man, what the fuck?')
				end
			end

		end

		context 'invalid initialism' do
			it 'returns original initialism' do
				expect(@ex.filter('ghoi')).to eq('ghoi')
			end
		end

		context 'no input' do
			it 'returns empty string' do
				expect(@ex.filter('')).to eq('')
			end
		end

	end

end
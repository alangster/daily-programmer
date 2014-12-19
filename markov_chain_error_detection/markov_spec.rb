require_relative 'markov'

describe SpellChecker do 

	before do 
		@spell = SpellChecker.new('practice_list.txt')
	end

	describe '#check' do

		context 'correctly spelled words' do

			"Cloacal lawyerly motiveless omni stocktaking Croon underrepresent bedevil transactionally selectman sewer Acidification quadrille speediness ballistocardiogram polydipsia buckram backlog sorer apian druidism bases Commiserate gallery like nonliterary shunned schistosis  unfeeding pursuivant ectozoan respiratory barge brander Primula archaeozoic captainship stalactite degraded hating sipper over happily mar perth uncentralized delegate".split.each do |word|
				it "considers #{word} correct" do
					expect(@spell.check(word)).to eq(word)
				end
			end

		end

		context 'misspelled words' do

			"loacal lavyersly motivele onip stoktaking Cron underepresnt bedeil tranactionay selectn swer Acidficavtion quadriulle speedinqss ballistoqcardiogram polydipsppia beckram backloug sorrrer apien druplidism besess Comminserute galleri likt nounliterrary shunnud schistoseos  unfeedg pursuivt ecozoan respiratary buorge brinlder Primulpa archaeoszoic captinshipt stalactiite degtaded hapying sizpur ovr hapilly mur parrth ucetralized dalagate".split.each do |word|
				it "considers #{word} incorrect" do
					expect(@spell.check(word)).to eq("**#{word}**")
				end
			end

		end


	end
	
end
require 'marky_markov'

# markov = MarkyMarkov::TemporaryDictionary.new
# markov.parse_file "output.txt"
# puts markov.generate_n_sentences 2
# # puts markov.generate_n_words 20
# markov.clear

module MsgGen
  def MsgGen.genMessage(num)
    markov = MarkyMarkov::TemporaryDictionary.new
    markov.parse_file "output.txt"
    markov.generate_n_sentences num
    # puts markov.generate_n_words 20
    # markov.clear
  end
end

require 'ruby-dice'

describe RubyDice::Passphrase do
  it 'returns a passphrase' do
    passphrase = RubyDice::Passphrase.generate(words: 5)
    passphrase.split(' ').size.should eql(5)
  end
end

describe RubyDice::Wordlist do
  context 'with the default wordlist' do
    let(:wordlist) { RubyDice::Wordlist.new }

    it 'loads the default wordlist' do
      wordlist.words.size.should eql(7776)
    end

    it 'returns a random list of words' do
      wordlist.random(5).should_not eql(wordlist.random(5))
    end

    it 'returns the specified amount of words' do
      wordlist.random(7).size.should eql(7)
    end
  end
end

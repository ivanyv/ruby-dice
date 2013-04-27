require 'ruby-dice'

describe RubyDice::Passphrase do
  it 'returns a passphrase' do
    passphrase = RubyDice::Passphrase.generate(words: 5)
    passphrase.split(' ').size.should eql(5)
  end

  it 'returns a passphrase from a custom wordlist' do
    file = File.join(File.dirname(__FILE__), 'fixtures', 'five')
    passphrase = RubyDice::Passphrase.generate(wordlist: file)
    passphrase.split(' ').size.should eql(5)
  end

  it 'returns a camel cased passphrase' do
    words = %w[mary had a little lamb]
    camel = 'maryHadALittleLamb'
    RubyDice::Wordlist.any_instance.stub(:random).and_return(words)
    passphrase = RubyDice::Passphrase.generate(camelcase: true)
    passphrase.should eql(camel)
  end

  it 'returns a passphrase with a number' do
    words = %w[mary had a little lamb]
    with_number = /mary had a little lamb\d+/
    RubyDice::Wordlist.any_instance.stub(:random).and_return(words)
    passphrase = RubyDice::Passphrase.generate(numbers: true)
    passphrase.should =~ with_number
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

  context 'with a custom wordlist' do
    it 'returns a random list of words' do
      file = File.join(File.dirname(__FILE__), 'fixtures', 'five')
      wordlist = RubyDice::Wordlist.new(file)
      wordlist.random(5).size.should eql(5)
      wordlist.words.size.should eql(5)
      (wordlist.words - %w[mary had a little lamb]).should eql([])
    end
  end
end

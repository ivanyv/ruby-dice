require 'ruby-dice'

describe RubyDice::Passphrase do
  it 'returns a passphrase' do
    passphrase = RubyDice::Passphrase.generate(words: 5)
    passphrase.split(' ').size.should eql(5)
  end
end

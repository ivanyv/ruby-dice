module RubyDice
  class Passphrase
    def self.generate(options = {})
      default_options = { words: 5 }
      options = default_options.merge(options)

      wordlist = Wordlist.new
      wordlist.random(options[:words]).join(' ')
    end
  end
end

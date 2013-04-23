module RubyDice
  class Passphrase
    def self.generate(options = {})
      default_options = { words: 5 }
      options = default_options.merge(options)

      wordlist_options = {}
      wordlist_options[:wordlist] = options.delete(:wordlist)

      wordlist = Wordlist.new(wordlist_options)
      wordlist.random(options[:words]).join(' ')
    end
  end
end

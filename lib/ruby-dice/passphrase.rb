module RubyDice
  class Passphrase
    def self.generate(options = {})
      default_options = { words: 5 }
      options = default_options.merge(options)

      wordlist_options = {}
      wordlist_options[:wordlist] = options.delete(:wordlist)

      wordlist = Wordlist.new(wordlist_options)
      words = wordlist.random(options[:words])

      if !words.detect { |w| w.match(/\d/) } && options[:numbers]
        words[-1] += SecureRandom.random_number(100).to_s
      end

      if options[:camelcase]
        words.map!(&:capitalize)
        words[0] = words[0].downcase
        phrase = words.join
      else
        phrase = words.join(' ')
      end

      phrase
    end
  end
end

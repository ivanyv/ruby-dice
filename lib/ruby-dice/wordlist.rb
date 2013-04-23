require 'securerandom'

module RubyDice
  class Wordlist
    attr_reader :words

    # Damn ugly... lets refactor sometime
    def initialize(filename_or_options = nil)
      options = {}
      filename = nil

      if filename_or_options.is_a?(Hash)
        options = filename_or_options
        filename = options[:wordlist]
      else
        filename = filename_or_options
      end

      filename ||= 'diceware.wordlist.asc'
      filename += '.txt' if File.extname(filename) == ''

      search_paths = [
                       File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'assets')),
                       File.join(Dir.home, '.wordlists')
                     ]

      # Too convoluted?
      unless full_path = (File.exists?(filename) ? filename : nil)
        path = search_paths.detect { |path| File.exists? File.join(path, filename) }
        full_path = File.join(path, filename)
      end

      File.open(full_path, 'r:UTF-8') { |f| @words = f.read }
      @words = @words.match(/(11111.+66666.+?)\n/m)[1].split("\n").map { |l| l.split(/[\t ]/)[1].strip }
    end

    def random(count = 5)
      (1..count).inject([]) do |selected|
        random = SecureRandom.random_number(@words.size)
        selected << @words[random]
      end
    end
  end
end

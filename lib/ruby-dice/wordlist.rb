require 'securerandom'

module RubyDice
  class Wordlist
    attr_reader :words
    
    def initialize(filename = nil)
      filename ||= File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'assets', 'diceware.wordlist.asc'))
      
      @words = File.read(filename).match(/(11111.+66666.+?)\n/m)[1].split("\n").map { |l| l.split("\t")[1].strip }
    end

    def random(count = 5)
      (1..count).inject([]) do |selected|
        random = SecureRandom.random_number(@words.size)
        selected << @words[random]
      end
    end
  end
end

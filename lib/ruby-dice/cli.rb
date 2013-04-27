require 'thor'
require 'ruby-dice'

module RubyDice
  class CLI < Thor
    desc 'throw', 'Generate and copy a passphrase'
    option :length,    type: :numeric, default: 5,     aliases: :l, desc: 'Amount of words to use'
    option :print,     type: :boolean, default: false, aliases: :p, desc: 'Output passphrase to terminal'
    option :wordlist,  type: :string,  default: nil,   aliases: :w, desc: 'Use a custom wordlist file', banner: 'filename'
    option :camelcase, type: :boolean, default: false, aliases: :c, desc: 'Generate a camelCase passphrase with no spaces'
    option :numbers,   type: :boolean, default: false, aliases: :n, desc: 'Generate a passphrase with at least one number'
    def throw
      passphrase_options = {}.tap do |o|
        o[:words] = options['length']
        o[:wordlist] = options['wordlist']
        o[:camelcase] = options['camelcase']
        o[:numbers] = options['numbers']
      end

      passphrase = RubyDice::Passphrase.generate passphrase_options
      IO.popen('xsel --clipboard --input', 'r+') { |c| c.print passphrase }
      puts passphrase if options['print']
    end
    default_task :throw
  end
end

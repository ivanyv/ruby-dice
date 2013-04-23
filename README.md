Ruby Dice
=========

![Ruby Dice](https://github.com/ivanyv/ruby-dice/raw/master/assets/dice.jpg)

I've been using this script for a while now to generate easier to type passwords.

In the past I used LastPass' generator, but typing those passwords in a phone is beyond painful.

Hope someone finds this useful and let me know what stupid security mistakes I've made :)

## Requirements

Probably just on *nix for now.

Needs the `xsel` program to copy passphrases to the clipboard.

## Usage

    $ gem install ruby-diceware
    $ dice help throw

## Custom wordlists

You can get additional wordlists from:

[http://world.std.com/~reinhold/diceware.html#languages](http://world.std.com/~reinhold/diceware.html#languages)

Save them to `~/.wordlists`. Say you save one to `~/.wordlists/custom.txt`, then to use:

    $ dice -w custom

## To do

* Find way to handle non UTF-8 wordlist files.

## Credits

Default wordlist taken from:

[http://world.std.com/~reinhold/diceware.html](http://world.std.com/~reinhold/diceware.html)

Pretty dice from:

[http://www.jukeboxprint.com/photo/Red%20Dice](http://www.jukeboxprint.com/photo/Red%20Dice)

## License

[MIT License](http://www.opensource.org/licenses/MIT).

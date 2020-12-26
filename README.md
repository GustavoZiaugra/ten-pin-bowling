[![Coverage Status](https://coveralls.io/repos/github/GustavoZiaugra/ten-pin-bowling/badge.svg)](https://coveralls.io/github/GustavoZiaugra/ten-pin-bowling) [![Maintainability](https://api.codeclimate.com/v1/badges/d7e5bc0d23eff4cca9cc/maintainability)](https://codeclimate.com/github/GustavoZiaugra/ten-pin-bowling/maintainability) ![Ruby](https://github.com/GustavoZiaugra/ten-pin-bowling/workflows/Ruby/badge.svg?branch=master)

# TenPinBowling
Ten-pin bowling is a type of bowling in which a bowler rolls a bowling ball down a wood or synthetic lane toward ten pins positioned evenly in four rows in an equilateral triangle at the far end of the lane. The objective is to knock down all ten pins on the first roll of the ball (a strike), or failing that, on the second roll (a spare).

The aim of the library is to provide the result of a match involving n players with a limit of 10 rounds from the entry of a file.

## Installation
You will need:
- Ruby 2.7.1 -> [Installation Guide](https://www.ruby-lang.org/pt/documentation/installation/)

Than run inside the folder:
- `bundle install`

### With Docker
You will need:
- Docker -> [Installation Guide](https://docs.docker.com/get-docker/)

Then run inside the folder:
- `docker run -it $(docker build -q .) bash`

## Usage

You can run this following command from the folder:
`bundle exec exe/ten_pin_bowling --help`
It will return a message explain how to use the script:
```
TenPinBowling - A CLI for Ten Pin Bowling score processing!"
------------------------------"
Usage:
  bundle exec exe/ten_pin_bowling input.txt
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/GustavoZiaugra/ten_pin_bowling.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

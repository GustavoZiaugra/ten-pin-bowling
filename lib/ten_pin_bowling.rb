# frozen_string_literal: true

require_relative "ten_pin_bowling/version"

module TenPinBowling
  class Error < StandardError; end

  # Class responsible to handle the input args from this CLI
  class CLI
    def main(argv)
      if argv.length.zero? || (argv[0] == "--help") || (argv[0] == "-h")
        help
      else
        game_file_path = argv[0]
        puts(game_file_path)
      end
    end

    def help
      puts <<~HEREDOC
        TenPinBowling - A CLI for Ten Pin Bowling score processing!."
        ------------------------------"
        Usage:
          bundle exec exe/ten_pin_bowling < input.txt
      HEREDOC
    end
  end
end

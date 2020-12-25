# frozen_string_literal: true

module TenPinBowling
  # This class is reponsible for calling the methods that make up the match processing
  class Runner
    def self.run(file_patch)
      parsed_file = TenPinBowling::Parser.parse_file(file_patch)
      process_scores = TenPinBowling::ProcessScore.process(parsed_file)
      TenPinBowling::Printer.print(process_scores)
    end
  end
end

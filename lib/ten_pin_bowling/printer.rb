# frozen_string_literal: true

module TenPinBowling
  # Class responsible to print the result of the fully match.
  class Printer
    def self.print(final_result)
      print_header
      print_result(final_result)
    end

    def self.print_header
      round_row = "Frame\t\t"
      (1..MAX_ROUNDS).map { |round_number| round_row += "#{round_number}\t" }
      puts round_row
    end

    def self.print_result(final_result)
      final_result.each do |player, rounds|
        puts player
        pinfalls_row = "Pinfalls\t"
        score_row = "Score\t\t"
        rounds.each_with_index do |round, index|
          pins = round['pins']
          unless ProcessScore.last_round?(index)
            if ProcessScore.strike?(pins[0])
              pinfalls_row += "   X\t"
            elsif ProcessScore.split?(pins)
              pinfalls_row += "#{pins[0]}  /\t"
            else
              pinfalls_row += "#{pins[0]}  #{pins[1]}\t"
            end
          else
            pinfalls_row += build_last_round(pins)
          end

          score_row += "#{round["score"]}\t"
        end
        puts pinfalls_row
        puts score_row
      end
    end

    def self.build_last_round(pins)
      output = "#{ProcessScore.strike?(pins[0]) ? 'X' : pins[0].to_s}  "
      [[pins[0], pins[1]], [pins[1], pins[2]]].each do |pin_pair|
        if ProcessScore.strike?(pin_pair[1])
          output += 'X  '
        elsif pin_pair[0].to_i + pin_pair[1].to_i == STRIKE_VALUE
          output += '/  '
        else
          output += "#{pin_pair[1].to_s}  "
        end
      end

      output
    end

    private_class_method :print_header, :print_result
  end
end

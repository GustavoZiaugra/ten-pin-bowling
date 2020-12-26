# frozen_string_literal: true

module TenPinBowling
  # This class is responsible to parse our input file to a struct.
  class Parser
    def self.parse_file(file_path)
      data_file = File.readlines(file_path).map(&:split)
      data_file.each_with_object(Hash.new { |hash, key| hash[key] = [] }) do |data, round|
        validate_line_format!(data)
        player = data[0]
        pins = parse_pins(data[1])
        validate_pins_score!(pins)
        parse_round(player, pins, round)
      end
    end

    def self.parse_round(player, pins, round)
      validate_max_round!(round[player])
      if round[player].empty?
        round[player] << [pins]
      elsif round[player].count == MAX_ROUNDS
        round[player].last << pins
      else
        assign_round(player, round, pins)
      end
    end

    def self.assign_round(player, round, pins)
      last_round = round[player].last
      if last_round.count == NON_FINAL_ROUND_MAX_THROWS || last_round.first == STRIKE_VALUE
        round[player] << [pins]
      else
        last_round << pins
      end
    end

    def self.parse_pins(pins)
      pins.match?(/[[:alpha:]]/) ? pins : pins.to_i
    end

    def self.validate_max_round!(round)
      if round.count == MAX_ROUNDS && round.last.count == 3
        raise ArgumentError,
              "The maximum amount of rounds to be processed is #{MAX_ROUNDS}. Please review your input file"
      end
    end

    def self.validate_pins_score!(pins)
      raise ArgumentError, "Pin value is invalid!: #{pins}" unless VALID_PINS_SCORES.include?(pins)
    end

    def self.validate_line_format!(line)
      raise ArgumentError, "Line has more than two fields! Line: #{line.join(" ")}" if line.length > 2
    end

    private_class_method :parse_round, :assign_round, :validate_line_format!, :validate_pins_score!, :parse_pins
  end
end

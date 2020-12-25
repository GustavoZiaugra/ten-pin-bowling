# frozen_string_literal: true

module TenPinBowling
  # This class is responsible to parse our input file to a struct.
  class Parser
    def self.parse_file(file_path)
      data_file = File.readlines(file_path).map(&:split)
      data_file.each_with_object(Hash.new { |hash, key| hash[key] = [] }) do |data, round|
        player = data[0]
        pins = parse_pins(data[1])
        parse_round(player, pins, round)
      end
    end

    def self.parse_round(player, pins, round)
      return unless valid_pins_score?(pins)

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
      if last_round.count == NON_FINAL_ROUND_MAX_PLAYS || last_round.first == STRIKE_VALUE
        round[player] << [pins]
      else
        last_round << pins
      end
    end

    def self.valid_pins_score?(pins)
      VALID_PINS_SCORES.include?(pins)
    end

    def self.parse_pins(pins)
      pins == 'F' ? pins : pins.to_i
    end

    private_class_method :parse_round, :assign_round, :valid_pins_score?, :parse_pins
  end
end

# frozen_string_literal: true

module TenPinBowling
  STRIKE_VALUE = 10
  MAX_ROUND = 10

  # This class is resonsible to parse our input file to a struct.
  class Parser
    def self.parse_file(file_path)
      data_file = File.readlines(file_path).map(&:split)
      data_file.each_with_object(Hash.new { |hash, key| hash[key] = [] }) do |data, round|
        player = data[0]
        pins = data[1].to_i
        parse_round(player, pins, round)
      end
    end

    def self.parse_round(player, pins, round)
      if round[player].empty?
        round[player] << [pins]
      elsif round[player].count == MAX_ROUND
        round[player].last << pins
      else
        assign_round(player, round, pins)
      end
    end

    def self.assign_round(player, round, pins)
      last_round = round[player].last
      if last_round.count == 2 || last_round.first == STRIKE_VALUE
        round[player] << [pins]
      else
        last_round << pins
      end
    end

    private_class_method :parse_round, :assign_round
  end
end

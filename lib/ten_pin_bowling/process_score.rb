# frozen_string_literal: true

module TenPinBowling
  # This class is responsible to process and agregate all rounds scores.
  class ProcessScore
    MAX_ROUNDS = 10

    def self.process(parsed_file)
      final_result = parsed_file.keys.each_with_object({}) do |player, game_result|
        apply_score(parsed_file, player, game_result)
      end

      final_result.values.each do |rounds|
        rounds.each_with_index do |round, index|
          next if first_round?(index)

          aggregate_score(rounds, round, index)
        end
      end

      final_result
    end

    def self.apply_score(parsed_file, player, game_result)
      game_result[player] = parsed_file[player].each_with_index.map do |round, index|
        score = round_score(round)

        unless last_round?(index)
          if strike?(round)
            score += apply_strike_score(index, player, parsed_file)
          elsif split?(round)
            score += parsed_file[player][index + 1][0].to_i
          end
        end

        build_hash(round, score)
      end
    end

    def self.apply_strike_score(index, player, parsed_file)
      if penultimate_round?(index)
        parsed_file[player][index + 1][0].to_i + parsed_file[player][index + 1][1].to_i
      elsif strike?(parsed_file[player][index + 1])
        10 + parsed_file[player][index + 2][0].to_i
      else
        round_score(parsed_file[player][index + 1])
      end
    end

    def self.build_hash(round, score)
      { "pins" => round, "score" => score }
    end

    def self.aggregate_score(frames, frame, frame_index)
      frame["score"] += frames[frame_index - 1]["score"]
    end

    def self.round_score(round)
      round.map(&:to_i).reduce(:+)
    end

    def self.strike?(round)
      round[0] == 10
    end

    def self.split?(round)
      round.count == 2 && round_score(round) == 10
    end

    def self.first_round?(index)
      index + 1 == 1
    end

    def self.penultimate_round?(index)
      index + 1 == 9
    end

    def self.last_round?(index)
      index + 1 == MAX_ROUNDS
    end

    private_class_method :apply_score, :apply_strike_score, :aggregate_score, :build_hash,
                         :round_score, :strike?, :split?, :first_round?, :penultimate_round?,
                         :last_round?
  end
end

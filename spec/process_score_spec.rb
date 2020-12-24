# frozen_string_literal: true

RSpec.describe TenPinBowling::ProcessScore do
  describe "#process" do
    it "should return a hash with all infos from the rounds and the aggregated score by round (sample file)" do
      input = { "Jeff" => [[10], [7, 3], [9, 0], [10], [0, 8], [8, 2], ["F", 6], [10], [10], [10, 8, 1]],
                "John" => [[3, 7], [6, 3], [10], [8, 1], [10], [10], [9, 0], [7, 3], [4, 4], [10, 9, 0]] }

      expect(TenPinBowling::ProcessScore.process(input)).to eq(
        { "Jeff" =>
          [{ "pins" => [10], "score" => 20 }, { "pins" => [7, 3], "score" => 39 },
           { "pins" => [9, 0], "score" => 48 }, { "pins" => [10], "score" => 66 },
           { "pins" => [0, 8], "score" => 74 }, { "pins" => [8, 2], "score" => 84 },
           { "pins" => ["F", 6], "score" => 90 }, { "pins" => [10], "score" => 120 },
           { "pins" => [10], "score" => 148 }, { "pins" => [10, 8, 1], "score" => 167 }],
          "John" => [{ "pins" => [3, 7], "score" => 16 }, { "pins" => [6, 3], "score" => 25 },
                     { "pins" => [10], "score" => 44 }, { "pins" => [8, 1], "score" => 53 },
                     { "pins" => [10], "score" => 82 }, { "pins" => [10], "score" => 101 },
                     { "pins" => [9, 0], "score" => 110 }, { "pins" => [7, 3], "score" => 124 },
                     { "pins" => [4, 4], "score" => 132 }, { "pins" => [10, 9, 0], "score" => 151 }] }
      )
    end

    it "should return a hash with all infos from the rounds and the aggregated score by round (perfect match file)" do
      input = { "Carl" => [[10], [10], [10], [10], [10], [10], [10], [10], [10], [10, 10, 10]] }

      expect(TenPinBowling::ProcessScore.process(input)).to eq(
        { "Carl" =>
          [{ "pins" => [10], "score" => 30 }, { "pins" => [10], "score" => 60 }, { "pins" => [10], "score" => 90 },
           { "pins" => [10], "score" => 120 }, { "pins" => [10], "score" => 150 }, { "pins" => [10], "score" => 180 },
           { "pins" => [10], "score" => 210 }, { "pins" => [10], "score" => 240 }, { "pins" => [10], "score" => 270 },
           { "pins" => [10, 10, 10], "score" => 300 }] }
      )
    end

    it "should return a hash with all infos from the rounds and the aggregated score by round (zero score file)" do
      input = { "Carl" => [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0, 0]] }

      expect(TenPinBowling:: ProcessScore.process(input)).to eq(
        { "Carl" =>
          [{ "pins" => [0, 0], "score" => 0 }, { "pins" => [0, 0], "score" => 0 }, { "pins" => [0, 0], "score" => 0 },
           { "pins" => [0, 0], "score" => 0 }, { "pins" => [0, 0], "score" => 0 }, { "pins" => [0, 0], "score" => 0 },
           { "pins" => [0, 0], "score" => 0 }, { "pins" => [0, 0], "score" => 0 }, { "pins" => [0, 0], "score" => 0 },
           { "pins" => [0, 0, 0], "score" => 0 }] }
      )
    end
  end
end

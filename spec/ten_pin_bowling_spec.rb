# frozen_string_literal: true

RSpec.describe TenPinBowling do
  it 'has a version number' do
    expect(TenPinBowling::VERSION).not_to be nil
  end
end

RSpec.describe TenPinBowling::CLI do
  describe '#main' do
    TenPinBowling::CLI::VALID_OPTIONS.each do |option|
      it "should return the help when #{option} is sent as params" do
        result = capture_stream($stdout) { TenPinBowling::CLI.new.main(option) }
        # rubocop:disable Layout/LineLength
        expect(result).to eq("TenPinBowling - A CLI for Ten Pin Bowling score processing!\"\n------------------------------\"\nUsage:\n  bundle exec exe/ten_pin_bowling spec/fixtures/sample_match.txt\n")
        # rubocop:enable Layout/LineLength
      end
    end

    it 'should print the result of a fully match at the end' do
      file = fixture_path('sample_match.txt')

      result = capture_stream($stdout) { TenPinBowling::CLI.new.main([file]) }

      # rubocop:disable Layout/LineLength
      expected_output =
        "Frame\t\t1\t2\t3\t4\t5\t6\t7\t8\t9\t10\t\nJeff\nPinfalls\t   X\t7  /\t9  0\t   X\t0  8\t8  /\tF  6\t   X\t   X\tX  8  1  \nScore\t\t20\t39\t48\t66\t74\t84\t90\t120\t148\t167\t\nJohn\nPinfalls\t3  /\t6  3\t   X\t8  1\t   X\t   X\t9  0\t7  /\t4  4\
\tX  9  0  \nScore\t\t16\t25\t44\t53\t82\t101\t110\t124\t132\t151\t\n"
      # rubocop:enable Layout/LineLength

      expect(result).to eq(expected_output)
    end
  end
end

# frozen_string_literal: true

RSpec.describe TenPinBowling::Runner do
  describe '#run' do
    it 'should print the result of a fully match at the end (sample file)' do
      file = fixture_path('sample_input.txt')

      result = capture_stream($stdout) { TenPinBowling::Runner.run(file) }

      # rubocop:disable Layout/LineLength
      expected_output =
        "Frame\t\t1\t2\t3\t4\t5\t6\t7\t8\t9\t10\t\nJeff\nPinfalls\t   X\t7  /\t9  0\t   X\t0  8\t8  /\tF  6\t   X\t   X\tX  8  1  \nScore\t\t20\t39\t48\t66\t74\t84\t90\t120\t148\t167\t\nJohn\nPinfalls\t3  /\t6  3\t   X\t8  1\t   X\t   X\t9  0\t7  /\t4  4\
\tX  9  0  \nScore\t\t16\t25\t44\t53\t82\t101\t110\t124\t132\t151\t\n"
      # rubocop:enable Layout/LineLength

      expect(result).to eq(expected_output)
    end

    it 'should print the result of a fully match at the end (perfect file)' do
      file = fixture_path('perfect_match.txt')

      result = capture_stream($stdout) { TenPinBowling::Runner.run(file) }

      # rubocop:disable Layout/LineLength
      expected_output =
        "Frame\t\t1\t2\t3\t4\t5\t6\t7\t8\t9\t10\t\nCarl\nPinfalls\t   X\t   X\t   X\t   X\t   X\t   X\t   X\t   X\t   X\tX  X  X  \nScore\t\t30\t60\t90\t120\t150\t180\t210\t240\t270\t300\t\n"
      # rubocop:enable Layout/LineLength

      expect(result).to eq(expected_output)
    end

    it 'should print the result of a fully match at the end (zero score file)' do
      file = fixture_path('zero_score_match.txt')

      result = capture_stream($stdout) { TenPinBowling::Runner.run(file) }

      # rubocop:disable Layout/LineLength
      expected_output =
        "Frame\t\t1\t2\t3\t4\t5\t6\t7\t8\t9\t10\t\nCarl\nPinfalls\t0  0\t0  0\t0  0\t0  0\t0  0\t0  0\t0  0\t0  0\t0  0\t0  0  0  \nScore\t\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t\n"
      # rubocop:enable Layout/LineLength

      expect(result).to eq(expected_output)
    end

    it 'should print the result of a fully match at the end (fouls score file)' do
      file = fixture_path('fouls_match.txt')

      result = capture_stream($stdout) { TenPinBowling::Runner.run(file) }

      # rubocop:disable Layout/LineLength
      expected_output =
        "Frame\t\t1\t2\t3\t4\t5\t6\t7\t8\t9\t10\t\nCarl\nPinfalls\tF  F\tF  F\tF  F\tF  F\tF  F\tF  F\tF  F\tF  F\tF  F\tF  F  F  \nScore\t\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t\n"
      # rubocop:enable Layout/LineLength

      expect(result).to eq(expected_output)
    end

  end
end

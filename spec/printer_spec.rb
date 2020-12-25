RSpec.describe TenPinBowling::Printer do
  describe '#print' do
    it 'should return the outputed game to the screen into the perfect format(sample match)' do
      input =
        { 'Jeff' =>
          [{ 'pins' => [10], 'score' => 20 }, { 'pins' => [7, 3], 'score' => 39 },
           { 'pins' => [9, 0], 'score' => 48 }, { 'pins' => [10], 'score' => 66 },
           { 'pins' => [0, 8], 'score' => 74 }, { 'pins' => [8, 2], 'score' => 84 },
           { 'pins' => ['F', 6], 'score' => 90 }, { 'pins' => [10], 'score' => 120 },
           { 'pins' => [10], 'score' => 148 }, { 'pins' => [10, 8, 1], 'score' => 167 }],
          'John' => [{ 'pins' => [3, 7], 'score' => 16 }, { 'pins' => [6, 3], 'score' => 25 },
                     { 'pins' => [10], 'score' => 44 }, { 'pins' => [8, 1], 'score' => 53 },
                     { 'pins' => [10], 'score' => 82 }, { 'pins' => [10], 'score' => 101 },
                     { 'pins' => [9, 0], 'score' => 110 }, { 'pins' => [7, 3], 'score' => 124 },
                     { 'pins' => [4, 4], 'score' => 132 }, { 'pins' => [10, 9, 0], 'score' => 151 }] }

      result = capture_stream($stdout) { TenPinBowling::Printer.print(input) }

      # rubocop:disable Layout/LineLength
      expected_output =
        "Frame\t\t1\t2\t3\t4\t5\t6\t7\t8\t9\t10\t\nJeff\nPinfalls\t   X\t7  /\t9  0\t   X\t0  8\t8  /\tF  6\t   X\t   X\tX  8  1  \nScore\t\t20\t39\t48\t66\t74\t84\t90\t120\t148\t167\t\nJohn\nPinfalls\t3  /\t6  3\t   X\t8  1\t   X\t   X\t9  0\t7  /\t4  4\
\tX  9  0  \nScore\t\t16\t25\t44\t53\t82\t101\t110\t124\t132\t151\t\n"
      # rubocop:enable Layout/LineLength

      expect(expected_output).to eq(result)
    end

    it 'should return the outputed game to the screen into the perfect format(perfect match)' do
      input =
        { 'Carl' =>
          [{ 'pins' => [10], 'score' => 30 }, { 'pins' => [10], 'score' => 60 }, { 'pins' => [10], 'score' => 90 },
           { 'pins' => [10], 'score' => 120 }, { 'pins' => [10], 'score' => 150 }, { 'pins' => [10], 'score' => 180 },
           { 'pins' => [10], 'score' => 210 }, { 'pins' => [10], 'score' => 240 }, { 'pins' => [10], 'score' => 270 },
           { 'pins' => [10, 10, 10], 'score' => 300 }] }

      result = capture_stream($stdout) { TenPinBowling::Printer.print(input) }

      # rubocop:disable Layout/LineLength
      expected_output =
        "Frame\t\t1\t2\t3\t4\t5\t6\t7\t8\t9\t10\t\nCarl\nPinfalls\t   X\t   X\t   X\t   X\t   X\t   X\t   X\t   X\t   X\tX  X  X  \nScore\t\t30\t60\t90\t120\t150\t180\t210\t240\t270\t300\t\n"
      # rubocop:enable Layout/LineLength
      #
      expect(expected_output).to eq(result)
    end

    it 'should return the outputed game to the screen into the perfect format(zero score match)' do
      input =
        { 'Carl' =>
          [{ 'pins' => [0, 0], 'score' => 0 }, { 'pins' => [0, 0], 'score' => 0 }, { 'pins' => [0, 0], 'score' => 0 },
           { 'pins' => [0, 0], 'score' => 0 }, { 'pins' => [0, 0], 'score' => 0 }, { 'pins' => [0, 0], 'score' => 0 },
           { 'pins' => [0, 0], 'score' => 0 }, { 'pins' => [0, 0], 'score' => 0 }, { 'pins' => [0, 0], 'score' => 0 },
           { 'pins' => [0, 0, 0], 'score' => 0 }] }

      result = capture_stream($stdout) { TenPinBowling::Printer.print(input) }

      # rubocop:disable Layout/LineLength
      expected_output =
        "Frame\t\t1\t2\t3\t4\t5\t6\t7\t8\t9\t10\t\nCarl\nPinfalls\t0  0\t0  0\t0  0\t0  0\t0  0\t0  0\t0  0\t0  0\t0  0\t0  0  0  \nScore\t\t0\t0\t0\t0\t0\t0\t0\t0\t0\t0\t\n"
      # rubocop:enable Layout/LineLength

      expect(expected_output).to eq(result)
    end
  end
end

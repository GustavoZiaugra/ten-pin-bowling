# frozen_string_literal: true

RSpec.describe TenPinBowling::Parser do
  describe '#parse_file' do
    it 'should return a parsed file into a hash structure (sample match)' do
      file = fixture_path('sample_match.txt')

      expect(TenPinBowling::Parser.parse_file(file)).to eq(
        { 'Jeff' => [[10], [7, 3], [9, 0], [10], [0, 8], [8, 2], ['F', 6], [10], [10], [10, 8, 1]],
          'John' => [[3, 7], [6, 3], [10], [8, 1], [10], [10], [9, 0], [7, 3], [4, 4], [10, 9, 0]] }
      )
    end

    it 'should return a parsed file into a hash structure (perfect match)' do
      file = fixture_path('perfect_match.txt')

      expect(TenPinBowling::Parser.parse_file(file)).to eq(
        { 'Carl' => [[10], [10], [10], [10], [10], [10], [10], [10], [10], [10, 10, 10]] }
      )
    end

    it 'should return a parsed file into a hash structure (zero score match)' do
      file = fixture_path('zero_score_match.txt')

      expect(TenPinBowling::Parser.parse_file(file)).to eq(
        { 'Carl' => [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0], [0, 0, 0]] }
      )
    end

    it 'should return a parsed file into a hash structure (fouls score match)' do
      file = fixture_path('fouls_match.txt')

      expect(TenPinBowling::Parser.parse_file(file)).to eq(
        { 'Carl' => [%w[F F], %w[F F], %w[F F], %w[F F], %w[F F], %w[F F], %w[F F], %w[F F],
%w[F F], %w[F F F]] }
      )
    end

    it 'should raise ArgumentError when file dont follow the format (2 fields per line)' do
      file = fixture_path('3_fields_per_line.txt')

      expect do
        TenPinBowling::Parser.parse_file(file)
      end.to raise_error(ArgumentError,
                         'Line has more than two fields! Line: Jeff 10 1')
    end

    it 'should raise ArgumentError when file contains a invalid value for the pins' do
      file = fixture_path('invalid_pin_value.txt')

      expect { TenPinBowling::Parser.parse_file(file) }.to raise_error(ArgumentError, 'Pin value is invalid!: Z')
    end

    it 'should raise ArgumentError when file contains more than 10 rounds' do
      file = fixture_path('more_than_10_rounds.txt')

      expect do
        TenPinBowling::Parser.parse_file(file)
      end.to raise_error(ArgumentError,
                         'The maximum amount of rounds to be processed is 10. Please review your input file')
    end
  end
end

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
  end
end

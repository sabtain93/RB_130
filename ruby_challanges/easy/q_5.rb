class Scrabble
  attr_reader :word

  SCORE_TILE = { %w(a e i o u l n r s t) => 1,
                 %w(d g) => 2,
                 %w(b c m p) => 3,
                 %w(f h v w y) => 4,
                 %w(k) => 5,
                 %w(j x) => 8,
                 %w(q z) => 10 }.freeze

  def initialize(word)
    @word = word || ''
  end

  def score
    score = 0
    char_arr = word.downcase.gsub(/[^a-z]/, '').chars

    char_arr.each do |char|
      SCORE_TILE.each do |letters, pts|
        score += pts if letters.include?(char)
      end
    end
    score
  end

  def self.score(str)
    Scrabble.new(str).score
  end
end

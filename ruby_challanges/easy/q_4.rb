class Anagram
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def match(str_arr)
    selected_arr = str_arr.select do |str|
      str.length == word.length && str.downcase != word.downcase
    end

    selected_arr.select do |str|
      str.downcase.chars.sort == word.downcase.chars.sort
    end
  end
end

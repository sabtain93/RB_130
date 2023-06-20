class DNA
  attr_reader :dna

  def initialize(dna)
    @dna = dna
  end

  def hamming_distance(sample_dna)
    shorter_dna, other_dna = find_shorter(sample_dna)
    other_arr = other_dna.chars
    shorter_arr = shorter_dna.chars
    counter = 0
    shorter_arr.each_index do |idx|
      if shorter_arr[idx] != other_arr[idx]
        counter += 1
      end
    end
    counter
  end

  private

  def find_shorter(str)
    return dna, str if dna.length < str.length
    return str, dna
  end
end

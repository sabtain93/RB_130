class SumOfMultiples
  attr_reader :num_arr

  def initialize(*set)
    @num_arr = set
  end

  def self.to(number)
    sum = 0

    (1...number).each do |num|
      sum += num if num % 3 == 0 || num % 5 == 0
    end

    sum
  end

  def to(number)
    sum = 0

    (1...number).each do |num|
      num_arr.each do |elem|
        if num % elem == 0
          sum += num
          break
        end
      end
    end
    sum
  end
end

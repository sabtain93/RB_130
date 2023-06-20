class Triangle
  attr_accessor :triangle

  def initialize(l1, l2, l3)
    @triangle = [l1, l2, l3]
    raise ArgumentError, "invalid triangle lengths" unless valid?
  end

  def kind
    if triangle.uniq.size == 1
      'equilateral'
    elsif triangle.uniq.size == 2
      'isosceles'
    else
      'scalene'
    end
  end

  private

  def valid?
    triangle.min > 0 &&
      add(0, 1) > triangle[2] &&
      add(0, 2) > triangle[1] &&
      add(1, 2) > triangle[0]
  end

  def add(idx1, idx2)
    triangle[idx1] + triangle[idx2]
  end
end

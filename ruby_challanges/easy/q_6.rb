class PerfectNumber
  def self.classify(num)
    raise StandardError, "The number is not valid" if num < 0

    sum = (1...num).to_a.select { |int| num % int == 0 }.inject(&:+)

    if sum == num
      'perfect'
    elsif sum < num
      'deficient'
    else
      'abundant'
    end
  end
end

class Octal
  attr_accessor :octal

  def initialize(octal)
    @octal = octal

    @octal = '0' if valid?
  end

  def to_decimal
    counter = octal.length - 1

    octal.chars.map do |char|
      counter
      dec = (char.to_i) * (8**counter)
      counter -= 1
      dec
    end.sum
  end

  private

  def valid?
    octal.match?(/[a-z8-9]/)
  end
end

require 'minitest/autorun'

require_relative 'transaction'
# require_relative 'cash_register'

class TransactionTest < Minitest::Test

  def test_prompt_for_payment
    transaction = Transaction.new(20)
    input = StringIO.new('30\n')
    output = StringIO.new

    transaction.prompt_for_payment(input: input, output: output)
    assert_equal(30, transaction.amount_paid)
  end

  # def test_prompt_for_payment
  #   transaction = Transaction.new(30)
  #   input = StringIO.new('30\n')
  #   transaction.prompt_for_payment(input: input)
  #   assert_equal 30, transaction.amount_paid
  # end

end






















# class TransactionTest < Minitest::Test

#   def test_prompt_for_payment_method
#     transaction = Transaction.new(30)
#     input = StringIO.new("30\n")
#     output = StringIO.new
#     transaction.prompt_for_payment(input: input, output: output)

#     assert_equal(30, transaction.amount_paid)
#   end

# end
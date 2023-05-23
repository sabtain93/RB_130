require 'minitest/autorun'
# require 'minitest/reporters'

# Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest:: Test

  def setup
    @cashreg1 = CashRegister.new(100)
    @transaction1 = Transaction.new(20)

    @transaction1.amount_paid = 40
  end

  def test_accept_money
    previous_amount = @cashreg1.total_money
    @cashreg1.accept_money(@transaction1)
    current_amount = @cashreg1.total_money
    assert_equal(previous_amount + 40, current_amount)
  end

  def test_change_method
    assert_equal(20, @cashreg1.change(@transaction1))
  end

  def test_giverecipt_method
    assert_output("You've paid $20.\n") { @cashreg1.give_receipt(@transaction1) }
  end

end
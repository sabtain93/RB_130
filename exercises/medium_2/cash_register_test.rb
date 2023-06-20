require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'


class CashRegister_test < Minitest::Test

  def test_accept_money
    cash_register = CashRegister.new(100)
    transaction = Transaction.new(50)
    transaction.amount_paid = 50

    initial_amount = cash_register.total_money
    cash_register.accept_money(transaction)
    current_amount = cash_register.total_money
    assert_equal(initial_amount + 50, current_amount)
  end

  def test_change
    cash_register = CashRegister.new(100)
    transaction = Transaction.new(50)
    transaction.amount_paid = 50

    change_amount = transaction.item_cost - transaction.amount_paid
    assert_equal(change_amount, cash_register.change(transaction))
  end

  def test_give_receipt
    item_cost = 50
    cash_register = CashRegister.new(100)
    transaction = Transaction.new(item_cost)

    assert_output("You've paid $#{item_cost}.\n") do
      cash_register.give_receipt(transaction)
    end
  end

end






























# require 'minitest/autorun'
# # require 'minitest/reporters'

# # Minitest::Reporters.use!

# require_relative 'cash_register'
# require_relative 'transaction'

# class CashRegisterTest < Minitest:: Test

#   def setup
#     @cashreg1 = CashRegister.new(100)
#     @transaction1 = Transaction.new(20)

#     @transaction1.amount_paid = 40
#   end

#   def test_accept_money
#     previous_amount = @cashreg1.total_money
#     @cashreg1.accept_money(@transaction1)
#     current_amount = @cashreg1.total_money
#     assert_equal(previous_amount + 40, current_amount)
#   end

#   def test_change_method
#     assert_equal(20, @cashreg1.change(@transaction1))
#   end

#   def test_giverecipt_method
#     assert_output("You've paid $20.\n") { @cashreg1.give_receipt(@transaction1) }
#   end

# end
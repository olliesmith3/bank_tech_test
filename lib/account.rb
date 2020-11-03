# frozen_string_literal: true

class Account
  attr_reader :balance, :history

  def initialize(starting_balance)
    @balance = starting_balance
    @history = []
  end

  def deposit(amount, transaction_class = Transaction)
    check_input(amount)

    @balance += amount
    @history << transaction_class.new(amount, @balance)
  end

  def withdraw(amount, transaction_class = Transaction)
    check_input(amount)
    raise 'Insufficient funds' if amount > @balance

    @balance -= amount
    @history << transaction_class.new(-amount, @balance)
  end

  private

  def check_input(amount)
    raise 'Amount must be a positive integer or decimal' if amount.is_a?(String) || !amount.positive?
  end
end

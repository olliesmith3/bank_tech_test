# frozen_string_literal: true

class Account
  attr_reader :balance, :history, :holder_name

  def initialize(holder_name, starting_balance)
    @holder_name = holder_name
    @balance = starting_balance
    @history = []
  end

  def deposit(amount, transaction_class = Transaction)
    @balance += amount
    @history << transaction_class.new(amount, @balance)
  end

  def withdraw(amount, transaction_class = Transaction)
    raise 'Insufficient funds' if amount > @balance

    @balance -= amount
    @history << transaction_class.new(-amount, @balance)
  end
end

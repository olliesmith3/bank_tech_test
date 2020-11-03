# frozen_string_literal: true

class Account
  attr_reader :starting_balance, :history

  def initialize(starting_balance)
    @starting_balance = starting_balance
    @history = []
  end

  def deposit(amount, transaction_class = Transaction, date = formatted_date)
    check_input(amount)

    @history << transaction_class.new(amount, date)
  end

  def withdraw(amount, transaction_class = Transaction, date = formatted_date)
    check_input(amount)

    @history << transaction_class.new(-amount, date)
  end

  private

  def check_input(amount)
    raise 'Amount must be a positive integer or decimal' if amount.is_a?(String) || !amount.positive?
  end

  def formatted_date
    Time.now.strftime('%d/%m/%Y')
  end
end

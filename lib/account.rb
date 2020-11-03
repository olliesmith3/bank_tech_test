# frozen_string_literal: true

class Account
  attr_reader :starting_balance, :history

  def initialize(starting_balance)
    @starting_balance = starting_balance
    # unless starting_balance.zero? 
    #   self.deposit(starting_balance)
    # end
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

  # def get_balance_after_transaction(amount)
  #   #raise 'Insufficient funds' if (@balance + amount).negative?

  #   (@balance += amount).to_s
  # end

  private

  def check_input(amount)
    raise 'Amount must be a positive integer or decimal' if amount.is_a?(String) || !amount.positive?
  end

  def formatted_date
    Time.now.strftime('%d/%m/%Y')
  end
end

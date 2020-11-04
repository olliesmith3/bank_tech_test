# frozen_string_literal: true

class Account
  attr_reader :starting_balance, :history

  def initialize(starting_balance = 0)
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

  def print_statement
    puts 'date || credit || debit || balance' + "\n" + statement_body
  end

  private

  def statement_body
    balance = @starting_balance
    chronological_transactions = @history.sort_by { |transaction| transaction.date }
    chronological_transactions.map do |transaction|
      balance += (transaction.credit.to_f - transaction.debit.to_f)
      transaction_data = transaction.date + ' || ' + transaction.credit + ' || ' + transaction.debit + ' || ' + format_balance(balance)
      transaction_data.gsub(/\s+/, ' ') + "\n"
    end.reverse.join
  end

  def format_balance(balance)
    '%.2f' % balance.to_s
  end

  def check_input(amount)
    raise 'Amount must be a positive integer or decimal' if amount.is_a?(String) || !amount.positive?
  end

  def formatted_date
    Time.now.strftime('%d/%m/%Y')
  end
end

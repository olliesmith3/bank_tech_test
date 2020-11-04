# frozen_string_literal: true

class Account
  attr_reader :starting_balance, :history

  def initialize(starting_balance = 0, transaction_class = Transaction)
    @starting_balance = starting_balance
    @history = []
    @transaction_class = transaction_class
  end

  def deposit(amount, date = Time.now)
    check_input(amount)

    @history << @transaction_class.new(amount, date)
  end

  def withdraw(amount, date = Time.now)
    check_input(amount)

    @history << @transaction_class.new(-amount, date)
  end

  def print_statement(american_date = nil)
    puts 'date || credit || debit || balance' + "\n" + statement_body(american_date)
  end

  private

  def statement_body(american_date)
    balance = @starting_balance
    chronological_transactions = @history.sort_by { |transaction| transaction.date }
    chronological_transactions.map do |transaction|
      credit, debit = format_credit_or_debit(transaction.amount), format_credit_or_debit(-transaction.amount)
      balance += (credit.to_f - debit.to_f)
      transaction_data = [format_date(transaction.date, american_date), credit, debit, format_money(balance)].join(' || ')
      transaction_data.squeeze(' ') + "\n"
    end.reverse.join
  end

  def format_credit_or_debit(amount)
    amount.negative? ? '' : format_money(amount.abs)
  end

  # This replaces an integer or a float with a string that has two decimal places ( 100 => '100.00', 95.95 => '95.95' )
  def format_money(amount)
    '%.2f' % amount.to_s
  end

  def check_input(amount)
    raise 'Amount must be a positive integer or decimal' if amount.is_a?(String) || !amount.positive?
  end

  def format_date(date, american_date)
    american_date == nil ? date.strftime('%d/%m/%Y') : date.strftime('%m/%d/%Y')
  end
end

# frozen_string_literal: true

class Account
  attr_reader :starting_balance, :history

  def initialize(starting_balance = 0, transaction_class = Transaction)
    @starting_balance = starting_balance
    @history = []
    @transaction_class = transaction_class
  end

  def deposit(amount, date = formatted_date)
    check_input(amount)

    @history << @transaction_class.new(amount, date)
  end

  def withdraw(amount, date = formatted_date)
    check_input(amount)

    @history << @transaction_class.new(-amount, date)
  end

  def print_statement
    puts 'date || credit || debit || balance' + "\n" + statement_body
  end

  private

  def statement_body
    balance = @starting_balance
    chronological_transactions = @history.sort_by { |transaction| transaction.date }
    chronological_transactions.map do |transaction|
      credit, debit = format_credit_or_debit(transaction.amount), format_credit_or_debit(-transaction.amount)
      balance += (credit.to_f - debit.to_f)
      transaction_data = [transaction.date, credit, debit, format_money(balance)].join(' || ')
      transaction_data.squeeze(' ') + "\n"
    end.reverse.join
  end

  def format_credit_or_debit(amount)
    if amount.negative?
      ''
    else
      format_money(amount.abs)
    end
  end

   # This replaces an integer or a float with a string that has two decimal places ( 100 => '100.00' )
  def format_money(amount)
    '%.2f' % amount.to_s
  end

  def check_input(amount)
    raise 'Amount must be a positive integer or decimal' if amount.is_a?(String) || !amount.positive?
  end

  def formatted_date
    Time.now.strftime('%d/%m/%Y')
  end
end

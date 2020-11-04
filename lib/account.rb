# frozen_string_literal: true

class Account
  attr_reader :starting_balance, :history

  def initialize(starting_balance = 0, transaction_class = Transaction)
    @starting_balance = starting_balance
    @history = []
    @transaction_class = transaction_class
    @american_date = false
    @three_columns = false
    @reverse_columns = false
  end

  def deposit(amount, date = Time.now)
    check_input(amount)

    @history << @transaction_class.new(amount, date)
  end

  def withdraw(amount, date = Time.now)
    check_input(amount)

    @history << @transaction_class.new(-amount, date)
  end

  def print_statement(option = 'no option')
    select(option)
    puts statement_head + "\n" + statement_body
    clear_options
  end

  private

  def clear_options
    @american_date = false
    @three_columns = false
    @reverse_columns = false
  end

  def select(option)
    american_date(option)
    three_columns(option)
    reverse_columns(option)
  end

  def american_date(option)
    @american_date = true if option.include? 'american date'
  end

  def three_columns(option)
    @three_columns = true if option.include? 'three columns'
  end

  def reverse_columns(option)
    @reverse_columns = true if option.include? 'reverse columns'
  end

  def statement_body
    balance = @starting_balance
    chronological_transactions = @history.sort_by(&:date)
    chronological_transactions.map do |transaction|
      credit = format_credit_or_debit(transaction.amount)
      debit = format_credit_or_debit(-transaction.amount)
      balance += (credit.to_f - debit.to_f)
      transaction_data(transaction, credit, debit, balance).join(' || ').squeeze(' ') + "\n"
    end.reverse.join
  end

  def transaction_data(transaction, credit, debit, balance)
    transactions_array = number_of_columns_body(format_date(transaction.date), credit, debit, format_money(balance))
    if @reverse_columns == true
      transactions_array.reverse
    else
      transactions_array
    end
  end

  def number_of_columns_body(date, credit, debit, balance)
    if @three_columns == true
      debit == '' ? [date, credit, balance] : [date, "(#{debit})", balance]
    else
      [date, credit, debit, balance]
    end
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

  def format_date(date)
    @american_date == false ? date.strftime('%d/%m/%Y') : date.strftime('%m/%d/%Y')
  end

  def statement_head
    if @reverse_columns == true
      @three_columns == false ? 'balance || debit || credit || date' : 'balance || transaction || date'
    else
      @three_columns == false ? 'date || credit || debit || balance' : 'date || transaction || balance'
    end
  end
end

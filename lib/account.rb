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

  def print_statement(option = "no option")
    select(option)
    puts number_of_columns_head + "\n" + statement_body
  end

  private

  def select(option)
    if option.include? "american date"
      @american_date = true
    elsif option.include? "three columns"
      @three_columns = true
    end 
  end

  def statement_body
    balance = @starting_balance
    chronological_transactions = @history.sort_by { |transaction| transaction.date }
    chronological_transactions.map do |transaction|
      credit, debit = format_credit_or_debit(transaction.amount), format_credit_or_debit(-transaction.amount)
      balance += (credit.to_f - debit.to_f)
      transaction_data = number_of_columns_body(format_date(transaction.date), credit, debit, format_money(balance)).join(' || ')
      transaction_data.squeeze(' ') + "\n"
    end.reverse.join
  end

  def number_of_columns_body(date, credit, debit, balance)
    if @three_columns == true
      if debit == ""
        [date, credit, balance]
      else
        [date, "(#{debit})", balance]
      end
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

  def number_of_columns_head
    @three_columns == false ? 'date || credit || debit || balance' : 'date || transaction || balance'
  end
end

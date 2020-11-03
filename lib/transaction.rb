# frozen_string_literal: true

require 'time'

class Transaction
  attr_reader :credit, :debit, :balance_after_transaction, :date

  def initialize(amount, balance_after_transaction)
    if amount.negative?
      @credit = format_amount(amount.abs)
      @debit = ''
    else
      @credit = ''
      @debit = format_amount(amount.abs)
    end
    @balance_after_transaction = format_amount(balance_after_transaction)
    @date = formatted_date
  end

  private

  # This replaces an integer with a string that has two decimal places ( 100 => '100.00' )
  def format_amount(amount)
    '%.2f' % amount
  end

  def formatted_date
    Time.now.strftime('%d/%m/%Y')
  end
end

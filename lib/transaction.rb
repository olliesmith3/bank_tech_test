# frozen_string_literal: true

require 'time'

class Transaction
  attr_reader :credit, :debit, :date

  def initialize(amount, date)
    if amount.negative?
      @credit = ''
      @debit = format_amount(amount.abs)
    else
      @credit = format_amount(amount.abs)
      @debit = ''
    end
    @date = date
  end

  private

  # This replaces an integer or a float with a string that has two decimal places ( 100 => '100.00' )
  def format_amount(amount)
    '%.2f' % amount
  end
end

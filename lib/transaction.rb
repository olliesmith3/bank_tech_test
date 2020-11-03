# frozen_string_literal: true

require 'time'

class Transaction
  attr_reader :credit, :debit, :balance_after_transaction, :date

  def initialize(amount, balance_after_transaction)
    if amount.negative?
      @credit = '%.2f' % amount.abs
      @debit = ''
    else
      @credit = ''
      @debit = '%.2f' % amount.abs
    end
    @balance_after_transaction = '%.2f' % balance_after_transaction
    @date = Time.now.strftime('%d/%m/%Y')
  end
end

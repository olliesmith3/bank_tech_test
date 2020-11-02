require 'time'

class Transaction

  attr_reader :credit, :debit, :balance, :date

  def initialize(amount, balance)
    if amount < 0
      @credit = '%.2f' % amount.abs
      @debit = ''
    else 
      @credit = ''
      @debit = '%.2f' % amount.abs
    end
    @balance = '%.2f' % (balance + amount)
    @date = Time.now.strftime("%d/%m/%Y") 
  end
end
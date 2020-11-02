require 'time'

class Transaction

  attr_reader :data

  def initialize(amount, balance)
    @data = { amount: '%.2f' % amount, balance: '%.2f' % balance, date: Time.now.strftime("%d/%m/%Y") }
  end
end
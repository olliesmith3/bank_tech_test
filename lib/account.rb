class Account

  attr_reader :balance

  def initialize(holder_name, starting_balance)
    @holder_name = holder_name
    @balance = starting_balance
  end

  def deposit(amount)
    @balance += amount
  end
end
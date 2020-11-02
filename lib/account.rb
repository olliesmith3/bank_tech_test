class Account

  attr_reader :balance

  def initialize(holder_name, starting_balance)
    @holder_name = holder_name
    @balance = starting_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    if amount > @balance
      raise 'Insufficient funds'
    else
      @balance -= amount
    end
  end
end
class Account

  attr_reader :balance, :history, :holder_name

  def initialize(holder_name, starting_balance)
    @holder_name = holder_name
    @balance = starting_balance
    @history = []
  end

  def deposit(amount, transaction_class = Transaction)
    @balance += amount
    @history << transaction_class.new(amount, @balance)
  end

  def withdraw(amount)
    if amount > @balance
      raise 'Insufficient funds'
    else
      @balance -= amount
    end
  end
end
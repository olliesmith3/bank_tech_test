class AccountManager
  def self.create_account(holder_name, starting_balance = 0.00, account_class = Account)
    account = account_class.new(holder_name, starting_balance)
  end
end

# Use '%.2f' % 500 to get 500.00
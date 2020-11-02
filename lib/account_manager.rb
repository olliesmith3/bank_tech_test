class AccountManager
  def self.create_account(holder_name, account_class = Account)
    account = account_class.new(holder_name)
  end
end
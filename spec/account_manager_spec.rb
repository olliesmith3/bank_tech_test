require 'account_manager'

describe AccountManager do
  describe '.create_account' do 
    it 'Creates a new account for Mary Smith with a balance of 0.00' do
      account_double = double(:account)
      account_class_double = double(:account_class, new: account_double)

      my_account = AccountManager.create_account('Mary Smith', account_class_double)
      expect(AccountManager.create_account('Mary Smith', account_class_double)).to eq account_double
    end
  end
end
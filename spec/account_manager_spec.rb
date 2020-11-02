require 'account_manager'

describe AccountManager do
  describe '.create_account' do 
    it 'Creates a new account for Mary Smith with a balance of 0.00' do
      account_double = double(:account, :balance => 0.00, :holder_name => 'Mary Smith')
      account_class_double = double(:account_class, new: account_double)

      my_account = AccountManager.create_account('Mary Smith', account_class_double)
      expect(my_account.balance).to eq 0.00
      expect(my_account.holder_name).to eq 'Mary Smith'
    end
  end
end
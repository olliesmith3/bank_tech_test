require 'account'

describe Account do
  describe '#deposit' do 
    it 'Increases the account balance by the deposit amount' do
      my_account = Account.new('Mary Smith', 0.00)
      expect{ my_account.deposit(100) }.to change { my_account.balance }.by(100)
    end
  end

  describe '#withdraw' do 
    it 'Decreases the account balance by the deposit amount' do
      my_account = Account.new('Mary Smith', 200.00)
      expect{ my_account.withdraw(100) }.to change { my_account.balance }.by(-100)
    end
  end
end
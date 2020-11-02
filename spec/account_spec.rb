require 'account'

describe Account do
  describe '#deposit' do 
    it 'Increases the account balance by the deposit amount' do
      my_account = Account.new('Mary Smith', 0.00)
      expect{ my_account.deposit(100) }.to change { my_account.balance }.by(100)
    end

    it 'Adds a tansaction object to the history array' do
      transaction_double = double(:transaction)
      transaction_class_double = double(:transaction_class, new: transaction_double)

      my_account = Account.new('Mary Smith', 0.00)
      my_account.deposit(100, transaction_class_double)
      expect(my_account.history).to eq [transaction_double]
    end
  end

  describe '#withdraw' do 
    it 'Decreases the account balance by the deposit amount' do
      my_account = Account.new('Mary Smith', 200.00)
      expect{ my_account.withdraw(100) }.to change { my_account.balance }.by(-100)
    end

    it 'Raises an error if attempting to withdraw more money than the balance' do
      my_account = Account.new('Mary Smith', 50.00)
      expect { raise StandardError, 'this message exactly'}.to raise_error('this message exactly')
      expect { my_account.withdraw(100) }.to raise_error('Insufficient funds')
    end
  end
end
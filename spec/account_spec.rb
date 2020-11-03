# frozen_string_literal: true

require 'account'

describe Account do
  let(:my_account) { Account.new(0.00) }
  let(:transaction_double) { double(:transaction) }
  let(:transaction_class_double) { double(:transaction_class, new: transaction_double) }

  describe '#deposit' do
    it 'Increases the account balance by the deposit amount' do
      expect { my_account.deposit(100) }.to change { my_account.balance }.by(100)
    end

    it 'Adds a transaction object to the history array' do
      my_account.deposit(100, transaction_class_double)
      expect(my_account.history).to eq [transaction_double]
    end

    it 'Raises an error if the amount is provided as a string' do
      expect { my_account.withdraw('100') }.to raise_error('Amount must be a positive integer or decimal')
    end

    it 'Raises an error if the amount is negative' do
      expect { my_account.withdraw(-50) }.to raise_error('Amount must be a positive integer or decimal')
    end
  end

  describe '#withdraw' do
    it 'Decreases the account balance by the deposit amount' do
      my_account = Account.new(200.00)
      expect { my_account.withdraw(100) }.to change { my_account.balance }.by(-100)
    end

    it 'Raises an error if attempting to withdraw more money than the balance' do
      expect { my_account.withdraw(100) }.to raise_error('Insufficient funds')
    end

    it 'Raises an error if the amount is provided as a string' do
      expect { my_account.withdraw('100') }.to raise_error('Amount must be a positive integer or decimal')
    end

    it 'Raises an error if the amount provided is zero' do
      expect { my_account.withdraw(0) }.to raise_error('Amount must be a positive integer or decimal')
    end
  end
end

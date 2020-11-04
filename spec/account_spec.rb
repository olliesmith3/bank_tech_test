# frozen_string_literal: true

require 'account'

describe Account do
  let(:transaction_double) { double(:transaction) }
  let(:transaction_class_double) { double(:transaction_class, new: transaction_double) }
  let(:my_account) { Account.new(0.00, transaction_class_double) }

  describe '#deposit' do
    it 'Adds a transaction to the history' do
      expect { my_account.deposit(100) }.to change { my_account.history.length }.by(1)
    end

    it 'Adds a transaction object to the history array' do
      my_account.deposit(100)
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
    it 'Adds a tranmsaction to the history' do
      my_account = Account.new(200.00)
      expect { my_account.deposit(100) }.to change { my_account.history.length }.by(1)
    end

    it 'Raises an error if the amount is provided as a string' do
      expect { my_account.withdraw('100') }.to raise_error('Amount must be a positive integer or decimal')
    end

    it 'Raises an error if the amount provided is zero' do
      expect { my_account.withdraw(0) }.to raise_error('Amount must be a positive integer or decimal')
    end
  end
end

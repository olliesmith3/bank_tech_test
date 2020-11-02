require 'transaction'
require 'timecop'

describe Transaction do

  before do
    Timecop.freeze(Time.local(1994))
  end

  describe '#initialize' do
    it 'Creates a transaction object with credit, debit, balance and date instance variables - a deposit' do
      transaction = Transaction.new(100, 600)
      expect(transaction.debit).to eq "100.00"
      expect(transaction.credit).to eq ""
      expect(transaction.balance).to eq "700.00"
      expect(transaction.date).to eq "01/01/1994"
    end

    it 'Creates a transaction object with credit, debit, balance and date instance variables - a withdrawal' do
      transaction = Transaction.new(-100, 600)
      expect(transaction.debit).to eq ""
      expect(transaction.credit).to eq "100.00"
      expect(transaction.balance).to eq "500.00"
      expect(transaction.date).to eq "01/01/1994"
    end
  end
end
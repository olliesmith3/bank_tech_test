require 'transaction'
require 'timecop'

describe Transaction do

  before do
    Timecop.freeze(Time.local(1994))
  end

  describe '#initialize' do
    it 'Creates a transaction object that is a hash with amount, balance and timestamp' do
      transaction = Transaction.new(100, 600)
      expect(transaction.data[:amount]).to eq "100.00"
      expect(transaction.data[:balance]).to eq "600.00"
      expect(transaction.data[:date]).to eq "01/01/1994"
    end
  end
end
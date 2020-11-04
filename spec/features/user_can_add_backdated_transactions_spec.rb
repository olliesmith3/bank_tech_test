# frozen_string_literal: true

require 'timecop'

describe 'See a list of the recent transactions' do
  before do
    Timecop.freeze(Time.local(1994))
  end

  it 'a backdated transaction is added last but appears at the bottom of the print_statement' do
    my_account = Account.new
    my_account.deposit(1000)
    my_account.withdraw(500, Transaction, '01/01/1995')
    my_account.deposit(2000, Transaction, '01/01/1993')
    expect { my_account.print_statement }.to output("date || credit || debit || balance\n01/01/1995 || || 500.00 || 2500.00\n01/01/1994 || 1000.00 || || 3000.00\n01/01/1993 || 2000.00 || || 2000.00\n").to_stdout
  end
end
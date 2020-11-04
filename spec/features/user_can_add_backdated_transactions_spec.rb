# frozen_string_literal: true

require 'timecop'

describe 'See a list of the recent transactions' do
  it 'a backdated transaction is added last but appears at the bottom of the print_statement' do
    my_account = Account.new
    my_account.deposit(1000, Time.new(1994, 1, 1))
    my_account.withdraw(500, Time.new(1995, 1, 1))
    my_account.deposit(2000, Time.new(1993, 1, 1))
    expect { my_account.print_statement }.to output("date || credit || debit || balance\n01/01/1995 || || 500.00 || 2500.00\n01/01/1994 || 1000.00 || || 3000.00\n01/01/1993 || 2000.00 || || 2000.00\n").to_stdout
  end
end

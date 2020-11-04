# frozen_string_literal: true

require 'timecop'

describe 'See a list of the recent transactions' do
  before do
    Timecop.freeze(Time.local(1994))
  end

  it 'User makes a series of transactions and can see them in a specified format - provided example(except for dates)' do
    my_account = Account.new
    my_account.deposit(1000)
    my_account.deposit(2000)
    my_account.withdraw(500)
    expect { my_account.print_statement }.to output("date || credit || debit || balance\n01/01/1994 || || 500.00 || 2500.00\n01/01/1994 || 2000.00 || || 3000.00\n01/01/1994 || 1000.00 || || 1000.00\n").to_stdout
  end
end

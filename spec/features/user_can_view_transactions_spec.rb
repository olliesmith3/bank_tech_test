require 'timecop'

describe 'See alist of the recent transactions' do

  before do
    Timecop.freeze(Time.local(1994))
  end

  it 'User makes a series of transactions and can see them in a specified format' do
    my_account = AccountManager.create_account('Mary Smith')
    my_account.deposit(100)
    my_account.deposit(70)
    my_account.withdraw(100)
    expect { AccountManager.print_statement(my_account) }.to output("date || credit || debit || balance\n01/01/1994 || || 100.00 || 100.00\n01/01/1994 || || 70.00 || 170.00\n01/01/1994 || 100.00 || || 70.00\n").to_stdout
  end
end
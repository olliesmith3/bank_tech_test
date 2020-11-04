# frozen_string_literal: true

require 'timecop'

describe 'See a list of the recent transactions' do
  before do
    Timecop.freeze(Time.local(1994, 10, 25))
  end

  it 'prints a statement with all three options selected' do
    my_account = Account.new
    my_account.deposit(2000)
    my_account.deposit(1000)
    my_account.withdraw(500)
    expect { my_account.print_statement('american date, three columns, reverse columns') }.to output("balance || transaction || date\n2500.00 || (500.00) || 10/25/1994\n3000.00 || 1000.00 || 10/25/1994\n2000.00 || 2000.00 || 10/25/1994\n").to_stdout
  end
end

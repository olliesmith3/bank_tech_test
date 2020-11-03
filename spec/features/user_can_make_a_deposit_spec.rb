# frozen_string_literal: true

describe 'make a deposit' do
  it 'User creates an account then makes a deposit and the balance has increased' do
    my_account = AccountManager.create_account
    my_account.deposit(100)
    expect(my_account.balance).to eq 100
  end
end

# frozen_string_literal: true

describe 'make a deposit' do
  it 'User creates an account then makes a deposit and a transaction has been added to the history' do
    my_account = AccountManager.create_account
    expect { my_account.deposit(100) }.to change { my_account.history.length }.by(1)
  end
end

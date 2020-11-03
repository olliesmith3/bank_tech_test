# frozen_string_literal: true

describe 'make a withdrawal' do
  it 'User creates an account then makes a withdrawal and the balance has decreased' do
    my_account = AccountManager.create_account
    my_account.deposit(100)
    expect { my_account.withdraw(50) }.to change { my_account.history.length }.by(1)
  end
end

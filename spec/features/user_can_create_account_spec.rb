# frozen_string_literal: true

describe 'create account' do
  it 'User creates an account' do
    my_account = AccountManager.create_account
    expect(my_account.starting_balance).to eq 0.00
  end
end

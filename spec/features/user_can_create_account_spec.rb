# frozen_string_literal: true

describe 'create account' do
  it 'User creates an account' do
    my_account = AccountManager.create_account('Mary Smith')
    expect(my_account.balance).to eq 0.00
    expect(my_account.holder_name).to eq 'Mary Smith'
  end
end

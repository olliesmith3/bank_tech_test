describe 'make a withdrawal' do
  it 'User creates an account then makes a withdrawal and the balance has decreased' do
    my_account = AccountManager.create_account('Mary Smith')
    my_account.deposit(100)
    my_account.withdraw(50)
    expect(my_account.balance).to eq 50
  end
end
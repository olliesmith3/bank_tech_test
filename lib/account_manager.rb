class AccountManager
  def self.create_account(holder_name, starting_balance = 0.00, account_class = Account)
    account_class.new(holder_name, starting_balance)
  end

  def self.print_statement(account)
    statement = 'date || credit || debit || balance' + "\n"
    account.history.reverse.each do |transaction|
      formatted_transaction = transaction.date + ' || ' + transaction.debit + ' || ' + transaction.credit + ' || ' + transaction.balance_after_transaction
      statement << formatted_transaction.gsub(/\s+/, ' ') + "\n"
    end
    puts statement
  end
end

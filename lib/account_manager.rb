class AccountManager
  def self.create_account(holder_name, starting_balance = 0.00, account_class = Account)
    account = account_class.new(holder_name, starting_balance)
  end

  def self.print_statement(account)
    statement = "date || credit || debit || balance" + "\n"
    account.history.each { |transaction|
      line = transaction.date + ' || ' + transaction.credit + ' || ' + transaction.debit + ' || ' + transaction.balance_after_transaction 
      statement << line.gsub(/\s+/, ' ') + "\n"
    }
    puts statement
  end
end

# frozen_string_literal: true

class AccountManager
  def self.create_account(holder_name, starting_balance = 0.00, account_class = Account)
    account_class.new(holder_name, starting_balance)
  end

  def self.print_statement(account)
    puts 'date || credit || debit || balance' + "\n" + AccountManager.statement_body(account)
  end

  private

  def self.statement_body(account)
    account.history.reverse.map { |transaction|
      transaction_data = transaction.date + ' || ' + transaction.debit + ' || ' + transaction.credit + ' || ' + transaction.balance_after_transaction
      transaction_data.gsub(/\s+/, ' ') + "\n"
    }.join
  end
end

# frozen_string_literal: true

class AccountManager
  class << self
    def create_account(holder_name, starting_balance = 0.00, account_class = Account)
      account_class.new(holder_name, starting_balance)
    end

    def print_statement(account)
      puts 'date || credit || debit || balance' + "\n" + AccountManager.statement_body(account)
    end

    protected
    
    def statement_body(account)
      account.history.reverse.map do |transaction|
        transaction_data = transaction.date + ' || ' + transaction.debit + ' || ' + transaction.credit + ' || ' + transaction.balance_after_transaction
        transaction_data.gsub(/\s+/, ' ') + "\n"
      end.join
    end
  end
end

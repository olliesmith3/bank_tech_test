# frozen_string_literal: true

class AccountManager
  class << self
    def create_account(starting_balance = 0.00, account_class = Account)
      account_class.new(starting_balance)
    end

    def print_statement(account)
      puts 'date || credit || debit || balance' + "\n" + AccountManager.statement_body(account)
    end

    protected
    
    def statement_body(account)
      balance = account.starting_balance
      chronological_transactions = account.history.sort_by { |transaction| transaction.date }
      chronological_transactions.map do |transaction|
        balance += (transaction.credit.to_f - transaction.debit.to_f)
        transaction_data = transaction.date + ' || ' + transaction.credit + ' || ' + transaction.debit + ' || ' + AccountManager.format_balance(balance)
        transaction_data.gsub(/\s+/, ' ') + "\n"
      end.reverse.join
    end

    def format_balance(balance)
      '%.2f' % balance.to_s
    end
  end
end

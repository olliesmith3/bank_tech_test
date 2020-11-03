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
      array = account.history.sort_by { |trans| trans.date }
      array.map do |transaction|
        balance += (transaction.credit.to_f - transaction.debit.to_f)
        transaction_data = transaction.date + ' || ' + transaction.credit + ' || ' + transaction.debit + ' || ' + '%.2f' % balance.to_s
        transaction_data.gsub(/\s+/, ' ') + "\n"
      end.reverse.join
    end
  end
end

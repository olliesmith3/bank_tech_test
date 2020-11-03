# frozen_string_literal: true

require 'account_manager'

describe AccountManager do
  let(:account_double) { double(:account) }
  let(:account_class_double) { double(:account_class, new: account_double) }

  describe '.create_account' do
    it 'Creates a new account for Mary Smith with a balance of 0.00' do
      expect(AccountManager.create_account(0.00, account_class_double)).to eq account_double
    end
  end
end

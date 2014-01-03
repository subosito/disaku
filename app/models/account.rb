class Account < ActiveRecord::Base
  include Accountable
  extend Enumerize

  belongs_to :user
  has_many :transactions
  has_many :sent_transfers, class_name: 'Transfer', foreign_key: 'from_account_id'
  has_many :received_transfers, class_name: 'Transfer', foreign_key: 'to_account_id'

  enumerize :account_type, in: [:saving, :cash, :other]

  def balance
    initial_amount + (total_received_transfers - total_sent_transfers) + (total_income - total_expense)
  end

  def total_received_transfers
    received_transfers.sum('amount')
  end

  def total_sent_transfers
    sent_transfers.sum('amount')
  end
end

class Account < ActiveRecord::Base
  include Accountable
  extend Enumerize

  belongs_to :user
  has_many :transactions
  has_many :sent_transfers, class_name: 'Transfer', foreign_key: 'from_account_id'
  has_many :received_transfers, class_name: 'Transfer', foreign_key: 'to_account_id'

  validates :name, presence: true, uniqueness: true
  validates :initial_amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

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

  def balance_with_date_range(date_start, date_end)
    transfers_received = received_transfers_with_date_range(date_start, date_end).sum(:amount)
    transfers_sent = sent_transfers_with_date_range(date_start, date_end).sum(:amount)

    incomes  = incomes_with_date_range(date_start, date_end)
    expenses = expenses_with_date_range(date_start, date_end)

    initial_amount + (transfers_received - transfers_sent) + (incomes - expenses)
  end

  def received_transfers_with_date_range(date_start, date_end)
    received_transfers.date_range(date_start, date_end)
  end

  def sent_transfers_with_date_range(date_start, date_end)
    sent_transfers.date_range(date_start, date_end)
  end
end

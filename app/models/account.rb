class Account < ActiveRecord::Base
  include Accountable
  extend Enumerize

  belongs_to :user

  has_many :transactions
  has_many :sent_transfers,     class_name: 'Transfer', foreign_key: 'from_account_id'
  has_many :received_transfers, class_name: 'Transfer', foreign_key: 'to_account_id'

  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :initial_amount, presence: true, numericality: { greater_than_or_equal_to: 0 }

  enumerize :account_type, in: [:saving, :cash, :other]

  def total_received_transfers
    received_transfers.sum_amount
  end

  def total_sent_transfers
    sent_transfers.sum_amount
  end

  def total_balances
    initial_amount + (total_received_transfers - total_sent_transfers) + (total_incomes - total_expenses)
  end

  def monthly_received_transfers
    received_transfers_with_date_range(*monthly_date_range)
  end

  def monthly_sent_transfers
    sent_transfers_with_date_range(*monthly_date_range)
  end

  def monthly_balances
    initial_amount + (monthly_received_transfers - monthly_sent_transfers) + (monthly_incomes - monthly_expenses)
  end

  def received_transfers_with_range(date_start, date_end)
    received_transfers.date_range(date_start, date_end).sum_amount
  end

  def sent_transfers_with_range(date_start, date_end)
    sent_transfers.date_range(date_start, date_end).sum_amount
  end

  def balances_with_range(date_start, date_end)
    transfers_received = received_transfers_with_range(date_start, date_end)
    transfers_sent     = sent_transfers_with_range(date_start, date_end)

    incomes  = incomes_with_range(date_start, date_end)
    expenses = expenses_with_range(date_start, date_end)

    initial_amount + (transfers_received - transfers_sent) + (incomes - expenses)
  end
end

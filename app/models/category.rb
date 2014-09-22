class Category < ActiveRecord::Base
  include Accountable
  extend Enumerize

  belongs_to :user
  has_many :transactions

  enumerize :category_type, in: [:income, :expense, :credit]

  scope :date_range, ->(date_start, date_end) do
    joins(:transactions).where(transactions: { id: Transaction.date_range(date_start, date_end) })
  end
end

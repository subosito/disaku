class Transaction < ActiveRecord::Base
  belongs_to :account
  belongs_to :category

  delegate :name, :to => :account, :prefix => true
  delegate :name, :to => :category, :prefix => true
  delegate :category_type, :to => :category, :prefix => false

  alias_method :transaction_type, :category_type

  validates :title, presence: true
  validates :amount, presence: true
  validates :transaction_date, presence: true

  scope :date_range, ->(date_start, date_end) do
    where(arel_table[:transaction_date].gteq(date_start)).where(arel_table[:transaction_date].lteq(date_end))
  end

  scope :with_account, ->(account) do
    where(:account => account)
  end

  scope :with_category, ->(category) do
    where(:category => category)
  end

  scope :with_transaction_type, ->(transaction_type) do
    joins(:category).where(:categories => { :category_type => transaction_type })
  end

  scope :sum_amount, -> { sum(:amount) }

  scope :total_amount, ->(transaction_type) do
    with_transaction_type(transaction_type).sum_amount
  end
end

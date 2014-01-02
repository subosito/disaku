class Account < ActiveRecord::Base
  include Accountable
  extend Enumerize

  belongs_to :user
  has_many :transactions

  enumerize :account_type, in: [:saving, :cash, :other]

  def balance
    initial_amount + (total_income - total_expense)
  end
end

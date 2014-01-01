class Account < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  has_many :transactions

  enumerize :category_type, in: [:income, :expense, :credit]
end

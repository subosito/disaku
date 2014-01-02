class Category < ActiveRecord::Base
  include Accountable
  extend Enumerize

  belongs_to :user
  has_many :transactions

  enumerize :category_type, in: [:income, :expense, :credit]
end

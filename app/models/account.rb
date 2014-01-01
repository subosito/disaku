class Account < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  has_many :transactions

  enumerize :account_type, in: [:saving, :cash, :other]
end

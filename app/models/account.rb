class Account < ActiveRecord::Base
  extend Enumerize

  belongs_to :user

  enumerize :account_type, in: [:saving, :cash, :other]
end

class UserSetting
  extend Enumerize

  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :locale, :language, :monthly_budget

  validates :monthly_budget, presence: true, numericality: { greater_than_or_equal_to: 0 }
  enumerize :language, in: [:en, :id]
end

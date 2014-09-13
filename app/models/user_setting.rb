class UserSetting
  include ActiveModel::Model

  attr_accessor :locale, :monthly_budget
end

class UserSetting
  include ActiveModel::Model

  attr_accessor :locale, :language, :monthly_budget
end

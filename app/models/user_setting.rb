class UserSetting
  include ActiveModel::Model

  attr_accessor :locale, :display_locale, :monthly_budget
end

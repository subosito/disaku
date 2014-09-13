class SettingsController < ApplicationController
  def show
    @setting = UserSetting.new({
      locale: current_user.settings.locale || :en,
      display_locale: current_user.settings.display_locale || :en,
      monthly_budget: current_user.settings.monthly_budget || 0
    })
  end

  def update
    sparams = params.fetch(:user_setting, {})
    current_user.settings.locale = (sparams[:locale] || 'en').to_sym
    current_user.settings.display_locale = (sparams[:display_locale] || 'en').to_sym
    current_user.settings.monthly_budget = (sparams[:monthly_budget] || '0').to_i
    redirect_to settings_path, notice: "Settings Saved!"
  end
end

class SettingsController < ApplicationController
  def show
    @user = current_user
    @setting = user_settings
  end

  def update
    setting = UserSetting.new(params.fetch(:user_setting, {}))

    if setting.valid?
      current_user.settings.locale = (setting.locale || Setting.locale).to_sym
      current_user.settings.language = (setting.language || Setting.language).to_sym
      current_user.settings.monthly_budget = (setting.monthly_budget || Setting.monthly_budget).to_i

      redirect_to settings_path, notice: "Settings Saved!"
    else
      @user = current_user
      @setting = setting
      render :show
    end
  end

  def filters
    fparams = params.fetch(:filter, {})
    session[:date_range_start] = fparams.fetch(:date_start, Date.today.beginning_of_month)
    session[:date_range_end]   = fparams.fetch(:date_end, Date.today.end_of_month)
    redirect_to :transactions
  end

  def password
    @user = User.find(current_user.id)
    if @user.update_with_password(user_params)
      sign_in(@user, bypass: true)
      redirect_to settings_path, notice: "Password has been successfully updated!"
    else
      @setting = user_settings
      render :show
    end
  end

  private
  def user_params
    params.required(:user).permit(:current_password, :password, :password_confirmation)
  end

  def user_settings
    UserSetting.new({
      locale: current_user.settings.locale,
      language: current_user.settings.language,
      monthly_budget: current_user.settings.monthly_budget,
    })
  end
end

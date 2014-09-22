require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  before_filter :authenticate_user!
  before_filter :set_filter!
  before_action :set_language!

  helper_method :date_range_start, :date_range_end, :current_locale

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :root, :alert => exception.message
  end

  def set_filter!
    @filter = Filter.new(date_start: date_range_start, date_end: date_range_end)
  end

  protected
  def after_sign_in_path_for(resource)
    stored_location_for(resource) || accounts_path
  end

  def date_range_start
    session[:date_range_start] ||= Date.today.beginning_of_month
  end

  def date_range_end
    session[:date_range_end] ||= Date.today.end_of_month
  end

  def current_user
    UserDecorator.decorate(super) unless super.nil?
  end

  def current_locale
    return :en if current_user.nil?
    current_user.settings.locale || :en
  end

  def current_language
    return :en if current_user.nil?
    current_user.settings.language || :en
  end

  def set_language!
    I18n.locale = current_language
  end
end

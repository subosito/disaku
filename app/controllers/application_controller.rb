require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  helper_method :date_range_start, :date_range_end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :root, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || accounts_path
  end

  def date_range_start
    session[:date_range_start] ||= Date.today.beginning_of_month
  end

  def date_range_end
    session[:date_range_end] ||= Date.today.end_of_month
  end
end

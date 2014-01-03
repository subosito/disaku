class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :root, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || accounts_path
  end
end

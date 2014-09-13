class ResourcesController < ApplicationController
  has_scope :page, :only => :index, :default => 1
  has_scope :per,  :only => :index, :default => Kaminari.config.default_per_page

  protected
  def save_date_range!
    if params.has_key?(:q)
      date_start = params[:q][:transaction_date_gteq]
      session[:date_range_start] = date_start.to_date if date_start

      date_end = params[:q][:transaction_date_lteq]
      session[:date_range_end] = date_end.to_date if date_end
    end
  end

  def search
    @search ||= resource_class.search(search_params)
  end

  def resource_class
    apply_scopes(controller_name.classify.constantize)
  end

  def search_params
    default_search_params.stringify_keys.merge(params.fetch(:q, {}))
  end

  def default_search_params
    {}
  end
end


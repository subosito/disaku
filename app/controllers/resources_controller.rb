class ResourcesController < ApplicationController
  has_scope :page, :only => :index, :default => 1
  has_scope :per,  :only => :index, :default => Kaminari.config.default_per_page

  protected
  def search
    @search ||= apply_scopes(resource_class).search(search_params)
  end

  def resource_class
    controller_name.classify.constantize
  end

  def search_params
    default_search_params.stringify_keys.merge(params.fetch(:q, {}))
  end

  def default_search_params
    {}
  end
end


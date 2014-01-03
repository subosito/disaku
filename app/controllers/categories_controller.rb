class CategoriesController < ResourcesController
  actions :all, :except => [:show]
  decorates_assigned :category, :categories

  def create
    create!{ categories_path }
  end

  def begin_of_association_chain
    current_user
  end

  def permitted_params
    params.permit(:category => [:name, :category_type])
  end

  protected
  def collection
    get_collection_ivar || begin
      set_collection_ivar(end_of_association_chain.order(:name))
    end
  end
end


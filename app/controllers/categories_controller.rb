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
end


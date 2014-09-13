class CategoriesController < ResourcesController
  load_and_authorize_resource
  decorates_assigned :category, :categories

  def index
  end

  def create
    @category.save
    respond_with(@category, location: categories_path)
  end

  def update
    @category.update_attributes(category_params)
    respond_with(@category, location: categories_path)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private
  def category_params
    params.require(:category).permit(:name, :category_type)
  end
end


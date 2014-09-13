class CategoriesController < ResourcesController
  load_and_authorize_resource
  skip_load_resource only: :index
  decorates_assigned :category, :categories

  def index
    @categories = current_user.categories.date_range(date_range_start, date_range_end).group('categories.id').order(:category_type, :name)
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


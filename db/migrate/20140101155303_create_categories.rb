class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :category_type
      t.references :user

      t.timestamps
    end
  end
end

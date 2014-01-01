class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :account_type
      t.decimal :initial_amount, precision: 15, scale: 2
      t.references :user

      t.timestamps
    end
    add_index :accounts, :user_id
  end
end

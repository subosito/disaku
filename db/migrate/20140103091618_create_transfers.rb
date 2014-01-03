class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.string :title
      t.date :transfer_date
      t.integer :from_account_id
      t.integer :to_account_id
      t.decimal :amount, precision: 15, scale: 2
      t.references :user

      t.timestamps
    end

    add_index :transfers, :from_account_id
    add_index :transfers, :to_account_id
    add_index :transfers, :user_id
  end
end

class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :account
      t.string :title
      t.decimal :amount, precision: 15, scale: 2
      t.references :category
      t.text :comment
      t.date :transaction_date

      t.timestamps
    end

    add_index :transactions, :account_id
    add_index :transactions, :category_id
  end
end

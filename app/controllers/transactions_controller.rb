class TransactionsController < ResourcesController
  actions :all, :except => [:show]
  decorates_assigned :transaction, :transactions

  def create
    create!{ transactions_path }
  end

  def begin_of_association_chain
    current_user
  end

  def permitted_params
    params.permit(:transaction => [:title, :account_id, :category_id, :transaction_date, :amount, :comment])
  end
end


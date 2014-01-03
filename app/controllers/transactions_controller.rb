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

  protected
  def collection
    get_collection_ivar || begin
      set_collection_ivar(end_of_association_chain.order(:transaction_date).reverse_order)
    end
  end
end


class TransactionsController < ResourcesController
  load_and_authorize_resource
  skip_load_resource only: :index
  decorates_assigned :transaction, :transactions

  def index
    @transactions = search.result
  end

  def create
    @transaction.save
    respond_with(@transaction, location: transactions_path)
  end

  def update
    @transaction.update_attributes(transaction_params)
    respond_with(@transaction, location: transactions_path)
  end

  def destroy
    @transaction.destroy
    respond_with(@transaction)
  end

  private
  def transaction_params
    params.require(:transaction).permit(:title, :account_id, :category_id, :transaction_date, :amount, :comment)
  end

  def resource_class
    apply_scopes(Transaction)
  end
end


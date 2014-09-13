class TransactionsController < ResourcesController
  load_and_authorize_resource
  skip_load_resource only: [:index, :settings]
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

  def settings
    fparams = params.fetch(:filter, {})
    session[:date_range_start] = fparams.fetch(:date_start, Date.today.beginning_of_month)
    session[:date_range_end]   = fparams.fetch(:date_end, Date.today.end_of_month)
    redirect_to :transactions
  end

  private
  def transaction_params
    params.require(:transaction).permit(:title, :account_id, :category_id, :transaction_date, :amount, :comment)
  end

  def search_params
    options = super
    options[:s] = 'transaction_date desc'
    options
  end

  def default_search_params
    { transaction_date_gteq: date_range_start, transaction_date_lteq: date_range_end }
  end
end


class TransfersController < ResourcesController
  load_and_authorize_resource
  skip_load_resource only: :index
  decorates_assigned :transfer, :transfers

  def index
    @transfers = search.result
  end

  def create
    @transfer.save
    respond_with(@transfer, location: transfers_path)
  end

  def update
    @transfer.update_attributes(transfer_params)
    respond_with(@transfer, location: transfers_path)
  end

  def destroy
    @transfer.destroy
    respond_with(@transfer)
  end

  private
  def transfer_params
    params.require(:transfer).permit(:title, :transfer_date, :from_account_id, :to_account_id, :amount)
  end

  def search_params
    options = super
    options[:s] = 'transfer_date desc'
    options
  end
end


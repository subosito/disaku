class AccountsController < ResourcesController
  load_and_authorize_resource
  skip_load_resource only: :index
  decorates_assigned :account, :accounts

  def index
    @accounts ||= current_user.accounts.order(:account_type, :name)
  end

  def create
    @account.save
    respond_with(@account, location: accounts_path)
  end

  def update
    @account.update_attributes(account_params)
    respond_with(@account, location: accounts_path)
  end

  def destroy
    @account.destroy
    respond_with(@account)
  end

  private
  def account_params
    params.require(:account).permit(:name, :account_type, :initial_amount)
  end
end


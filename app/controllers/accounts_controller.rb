class AccountsController < ApplicationController
  load_and_authorize_resource
  decorates_assigned :account, :accounts

  def index
  end

  def create
  end

  def update
    if @account.update_attributes(account_params)
      redirect_to({ action: :index }, notice: "Account has been saved!")
    else
      render :edit
    end
  end

  def destroy
  end

  private
  def account_params
    params.require(:account).permit(:name, :account_type, :initial_amount)
  end
end


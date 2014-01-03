class TransfersController < ResourcesController
  actions :all, :except => [:show]
  decorates_assigned :transfer, :transfers

  def create
    create!{ transactions_path }
  end

  def begin_of_association_chain
    current_user
  end

  def permitted_params
    params.permit(:transfer => [:title, :transfer_date, :from_account_id, :to_account_id, :amount])
  end
end


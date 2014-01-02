class AccountsController < ResourcesController
  actions :all, :except => [:show]
  decorates_assigned :account, :accounts

  def create
    create!{ accounts_path }
  end

  def begin_of_association_chain
    current_user
  end

  def permitted_params
    params.permit(:account => [:name, :account_type, :initial_amount])
  end
end


class AccountsController < ResourcesController
  actions :all, :except => [:show]

  def create
    create!{ accounts_path }
  end

  def begin_of_association_chain
    current_user
  end
end


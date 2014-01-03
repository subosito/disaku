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

  protected
  def collection
    get_collection_ivar || begin
      set_collection_ivar(end_of_association_chain.order(:transfer_date).reverse_order)
    end
  end
end


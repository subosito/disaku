class TransferDecorator < ApplicationDecorator
  delegate_all

  def link_to_edit
    super(object, h.edit_transfer_path(object))
  end

  def link_to_delete
    super(object, h.transfer_path(object))
  end

  def link_to_actions
    merge_links([ link_to_edit, link_to_delete ])
  end

  def amount
    to_currency(object.amount)
  end
end

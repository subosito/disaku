class TransferDecorator < ApplicationDecorator
  delegate_all

  def link_to_edit
    h.link_to_edit(object, h.edit_transfer_path(object))
  end

  def link_to_delete
    h.link_to_delete(object, h.transfer_path(object))
  end

  def link_to_actions
    merge_links([ link_to_edit, link_to_delete ])
  end
end

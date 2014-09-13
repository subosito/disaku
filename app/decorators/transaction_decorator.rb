class TransactionDecorator < ApplicationDecorator
  delegate_all
  decorates_association :category

  def label
    category.label
  end

  def amount
    to_currency(object.amount)
  end

  def link_to_edit
    super(object, h.edit_transaction_path(object))
  end

  def link_to_delete
    super(object, h.transaction_path(object))
  end

  def link_to_actions
    merge_links([ link_to_edit, link_to_delete ])
  end
end

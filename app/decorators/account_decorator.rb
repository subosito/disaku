class AccountDecorator < CommonDecorator
  delegate_all

  def balance
    to_currency(object.balance)
  end

  def label
    h.content_tag :span, object.account_type, class: "label #{label_class}"
  end

  def link_to_edit
    super(object, h.edit_account_path(object))
  end

  def link_to_delete
    super(object, h.account_path(object))
  end

  def link_to_actions
    merge_links([ link_to_edit, link_to_delete ])
  end

  private
  def label_class
    case object.account_type
    when 'saving'
      'label-primary'
    when 'cash'
      'label-success'
    when 'other'
      'label-info'
    else
      'label-default'
    end
  end
end

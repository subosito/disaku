class AccountDecorator < AccountableDecorator
  delegate_all

  def balances_with_range
    to_currency(object.balances_with_range(h.date_range_start, h.date_range_end))
  end

  def incomes_with_range
    to_currency(object.incomes_with_range(h.date_range_start, h.date_range_end))
  end

  def expenses_with_range
    to_currency(object.expenses_with_range(h.date_range_start, h.date_range_end))
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

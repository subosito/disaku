class CategoryDecorator < AccountableDecorator
  delegate_all

  def label
    h.content_tag :span, object.category_type, class: "label #{label_class}"
  end

  def link_to_edit
    super(object, h.edit_category_path(object))
  end

  def link_to_delete
    super(object, h.category_path(object))
  end

  def link_to_actions
    merge_links([ link_to_edit, link_to_delete ])
  end

  def expense
    to_currency(object.expense(h.date_range_start, h.date_range_end))
  end

  def income
    to_currency(object.income(h.date_range_start, h.date_range_end))
  end

  private
  def label_class
    case object.category_type
    when 'income'
      'label-primary'
    when 'expense'
      'label-warning'
    when 'credit'
      'label-info'
    else
      'label-default'
    end
  end
end

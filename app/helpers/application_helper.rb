module ApplicationHelper
  def to_currency(amount)
    number_to_currency(amount, unit: 'Rp', precision: 0, format: "%u %n", separator: ',', delimiter: '.')
  end

  def link_to_edit(object, link_path)
    link_to(content_tag(:i, nil, class: 'icon-pencil'), link_path, class: 'btn btn-xs btn-warning') if can? :edit, object
  end

  def link_to_delete(object, link_path)
    link_to(content_tag(:i, nil, class: 'icon-trash'), link_path, class: 'btn btn-xs btn-danger', method: :delete, confirm: "Are you sure?") if can? :delete, object
  end
end

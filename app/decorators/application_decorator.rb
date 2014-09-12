class ApplicationDecorator < Draper::Decorator
  def merge_links(links)
    links.reject{|el| el.blank? }.join(' ').html_safe
  end

  def to_currency(amount)
    h.number_to_currency(amount, unit: 'Rp', precision: 0, format: "%u %n", separator: ',', delimiter: '.')
  end

  def link_to_edit(object, link_path)
    return if h.cannot? :edit, object
    h.link_to(h.content_tag(:i, nil, class: 'fa fa-pencil'), link_path, class: 'btn btn-xs btn-info')
  end

  def link_to_delete(object, link_path)
    return if h.cannot?:delete, object
    h.link_to(h.content_tag(:i, nil, class: 'fa fa-trash'), link_path, class: 'btn btn-xs btn-danger', method: :delete, data: { confirm: "Are you sure?" })
  end
end

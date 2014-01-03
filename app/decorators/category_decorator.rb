class CategoryDecorator < ApplicationDecorator
  delegate_all

  def label
    h.content_tag :span, object.category_type, class: "label #{label_class}"
  end

  def link_to_edit
    h.link_to_edit(object, h.edit_category_path(object))
  end

  def link_to_delete
    h.link_to_delete(object, h.category_path(object))
  end

  def link_to_actions
    merge_links([ link_to_edit, link_to_delete ])
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

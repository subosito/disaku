class CategoryDecorator < ApplicationDecorator
  delegate_all

  def label
    h.content_tag :span, object.category_type, class: "label #{label_class}"
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

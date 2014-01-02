class AccountDecorator < ApplicationDecorator
  delegate_all

  def balance
    h.to_currency(object.balance)
  end

  def label
    h.content_tag :span, object.account_type, class: "label #{label_class}"
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

class AccountDecorator < ApplicationDecorator
  delegate_all

  def total_expense
    h.to_currency(account.total_expense)
  end

  def monthly_expense
    h.to_currency(account.monthly_expense)
  end

  def total_income
    h.to_currency(account.total_income)
  end

  def monthly_income
    h.to_currency(account.monthly_income)
  end

  def balance
    h.to_currency(account.balance)
  end

  def label
    h.content_tag :span, account.account_type, class: "label #{label_class}"
  end

  private
  def label_class
    case account.account_type
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

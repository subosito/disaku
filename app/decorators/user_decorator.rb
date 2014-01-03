class UserDecorator < ApplicationDecorator
  delegate_all

  def monthly_income
    h.to_currency(object.monthly_income)
  end

  def monthly_expense
    h.to_currency(object.monthly_expense)
  end

  def available_cash
    h.to_currency(object.available_cash)
  end

  def monthly_due_target
    h.to_currency(object.monthly_due_target)
  end
end

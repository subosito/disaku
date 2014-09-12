class UserDecorator < CommonDecorator
  delegate_all

  def monthly_income
    to_currency(object.monthly_income)
  end

  def monthly_expense
    to_currency(object.monthly_expense)
  end

  def available_cash
    to_currency(object.available_cash)
  end

  def monthly_due_target
    to_currency(object.monthly_due_target)
  end
end

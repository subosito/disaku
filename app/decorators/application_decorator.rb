class ApplicationDecorator < Draper::Decorator
  def total_expense
    h.to_currency(object.total_expense)
  end

  def monthly_expense
    h.to_currency(object.monthly_expense)
  end

  def total_income
    h.to_currency(object.total_income)
  end

  def monthly_income
    h.to_currency(object.monthly_income)
  end
end

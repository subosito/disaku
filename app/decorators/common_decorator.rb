class CommonDecorator < ApplicationDecorator
  def total_expense
    to_currency(object.total_expense)
  end

  def monthly_expense
    to_currency(object.monthly_expense)
  end

  def total_income
    to_currency(object.total_income)
  end

  def monthly_income
    to_currency(object.monthly_income)
  end

  def expense
    to_currency(object.expense(h.date_range_start, h.date_range_end))
  end

  def income
    to_currency(object.income(h.date_range_start, h.date_range_end))
  end
end

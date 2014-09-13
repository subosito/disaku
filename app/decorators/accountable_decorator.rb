class AccountableDecorator < ApplicationDecorator
  def total_incomes
    to_currency(object.total_incomes)
  end

  def total_expenses
    to_currency(object.total_expenses)
  end

  def monthly_incomes
    to_currency(object.monthly_incomes)
  end

  def monthly_expenses
    to_currency(object.monthly_expenses)
  end

  def incomes_with_range
    to_currency(object.incomes_with_range(h.date_range_start, h.date_range_end))
  end

  def expenses_with_range
    to_currency(object.expenses_with_range(h.date_range_start, h.date_range_end))
  end
end

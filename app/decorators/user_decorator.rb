class UserDecorator < AccountableDecorator
  delegate_all

  def monthly_incomes
    to_currency(object.monthly_incomes)
  end

  def monthly_expenses
    to_currency(object.monthly_expenses)
  end

  def available_cash
    to_currency(object.available_cash)
  end

  def monthly_due_target
    to_currency(object.monthly_due_target)
  end
end

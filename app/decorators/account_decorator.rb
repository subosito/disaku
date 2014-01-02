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
end

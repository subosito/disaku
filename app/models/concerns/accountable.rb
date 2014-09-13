module Accountable
  extend ActiveSupport::Concern

  def total_incomes
    transactions.total_amount(:income)
  end

  def total_expenses
    transactions.total_amount(:expense)
  end

  def monthly_incomes
    incomes_with_range(*monthly_date_range)
  end

  def monthly_expenses
    expenses_with_range(*monthly_date_range)
  end

  def incomes_with_range(date_start, date_end)
    transactions.with_transaction_type(:income).date_range(date_start, date_end).sum_amount
  end

  def expenses_with_range(date_start, date_end)
    transactions.with_transaction_type(:expense).date_range(date_start, date_end).sum_amount
  end

  def monthly_date_range
    [Date.today.beginning_of_month, Date.today.end_of_month]
  end
end

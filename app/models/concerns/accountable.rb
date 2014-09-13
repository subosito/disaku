module Accountable
  extend ActiveSupport::Concern

  def total_expense
    transactions.total_amount(:expense)
  end

  def monthly_expense
    transactions.with_transaction_type(:expense).date_range(*monthly_date_range).sum_amount
  end

  def expense(date_start, date_end)
    transactions.with_transaction_type(:expense).date_range(date_start, date_end).sum_amount
  end

  def total_income
    transactions.total_amount(:income)
  end

  def monthly_income
    transactions.with_transaction_type(:income).date_range(*monthly_date_range).sum_amount
  end

  def income(date_start, date_end)
    transactions.with_transaction_type(:income).date_range(date_start, date_end).sum_amount
  end

  private
  def monthly_date_range
    today = Date.today
    [today.beginning_of_month, today.end_of_month]
  end
end

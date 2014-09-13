class User < ActiveRecord::Base
  include RailsSettings::Extend

  has_many :accounts
  has_many :categories
  has_many :transactions, through: :accounts
  has_many :transfers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
       # :confirmable, :lockable, :timeoutable and :omniauthable

  rolify

  def monthly_budget
    settings.monthly_budget || 0
  end

  def monthly_due_target
    monthly_budget - monthly_expenses
  end

  def monthly_budget?
    !monthly_budget.zero?
  end

  def total_balances
    (total_assets + total_incomes) - total_expenses
  end

  def total_incomes
    accounts.map(&:total_incomes).inject(0, :+)
  end

  def monthly_incomes
    accounts.map(&:monthly_incomes).inject(0, :+)
  end

  def total_expenses
    accounts.map(&:total_expenses).inject(0, :+)
  end

  def monthly_expenses
    accounts.map(&:monthly_expenses).inject(0, :+)
  end

  def total_assets
    accounts.map(&:initial_amount).inject(0, :+)
  end

  def available_cash
    accounts.where(:account_type => :cash).map(&:total_balances).inject(0, :+)
  end
end


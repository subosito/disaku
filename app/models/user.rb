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
    monthly_expense - monthly_budget
  end

  def total_balance
    (total_assets + total_income) - total_expense
  end

  def total_income
    accounts.map(&:total_income).inject(0, :+)
  end

  def monthly_income
    accounts.map(&:monthly_income).inject(0, :+)
  end

  def total_expense
    accounts.map(&:total_expense).inject(0, :+)
  end

  def monthly_expense
    accounts.map(&:monthly_expense).inject(0, :+)
  end

  def total_assets
    accounts.map(&:initial_amount).inject(0, :+)
  end

  def available_cash
    accounts.where(:account_type => :cash).map(&:balance).inject(0, :+)
  end
end


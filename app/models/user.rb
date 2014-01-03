class User < ActiveRecord::Base
  has_many :accounts
  has_many :categories
  has_many :transactions, through: :accounts
  has_many :transfers

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
       # :confirmable, :lockable, :timeoutable and :omniauthable

  rolify
end

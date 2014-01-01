class User < ActiveRecord::Base
  has_many :accounts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
       # :confirmable, :lockable, :timeoutable and :omniauthable

  rolify
end

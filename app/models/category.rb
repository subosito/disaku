class Category < ActiveRecord::Base
  include Accountable
  extend Enumerize

  belongs_to :user
  has_many :transactions

  enumerize :category_type, in: [:income, :expense, :credit]

  def self.grouped_options_for_select
    all.reduce({}) do |a, v|
      (a[v.category_type] ||= []).push(v); a
    end
  end
end

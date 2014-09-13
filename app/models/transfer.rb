class Transfer < ActiveRecord::Base
  belongs_to :from_account, class_name: 'Account', foreign_key: 'from_account_id'
  belongs_to :to_account, class_name: 'Account', foreign_key: 'to_account_id'

  scope :date_range, ->(date_start, date_end) do
    where(arel_table[:transfer_date].gteq(date_start)).where(arel_table[:transfer_date].lteq(date_end))
  end
end

require 'rails_helper'

RSpec.describe Transfer, :type => :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:from_account).class_name('Account').with_foreign_key('from_account_id') }
  it { is_expected.to belong_to(:to_account).class_name('Account').with_foreign_key('to_account_id') }
end

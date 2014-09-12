require 'rails_helper'

RSpec.describe Account, :type => :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:transactions) }
  it { is_expected.to have_many(:sent_transfers).class_name('Transfer').with_foreign_key('from_account_id') }
  it { is_expected.to have_many(:received_transfers).class_name('Transfer').with_foreign_key('to_account_id') }
end

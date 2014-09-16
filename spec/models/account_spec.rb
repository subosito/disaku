require 'rails_helper'

RSpec.describe Account, :type => :model do
  context "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:transactions) }
    it { is_expected.to have_many(:sent_transfers).class_name('Transfer').with_foreign_key('from_account_id') }
    it { is_expected.to have_many(:received_transfers).class_name('Transfer').with_foreign_key('to_account_id') }
  end

  context "validations" do
    it { is_expected.to enumerize(:account_type).in(:saving, :cash, :other) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name).scoped_to(:user_id) }
    it { is_expected.to validate_presence_of(:initial_amount) }
    it { is_expected.to validate_numericality_of(:initial_amount).is_greater_than_or_equal_to(0) }
  end
end

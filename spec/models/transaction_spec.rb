require 'rails_helper'

RSpec.describe Transaction, :type => :model do
  context "associations" do
    it { is_expected.to belong_to(:account) }
    it { is_expected.to belong_to(:category) }
  end

  context "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:transaction_date) }
  end

  context "delegations" do
    it { is_expected.to delegate_method(:account_name).to(:account).as(:name) }
    it { is_expected.to delegate_method(:category_name).to(:category).as(:name) }
    it { is_expected.to delegate_method(:category_type).to(:category) }
  end
end

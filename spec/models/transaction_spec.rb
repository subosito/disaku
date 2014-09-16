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

  context "scopes" do
    let!(:transaction_a) { create(:transaction, transaction_date: Date.today) }
    let!(:transaction_b) { create(:transaction, transaction_date: 1.day.ago) }
    let!(:transaction_c) { create(:transaction, transaction_date: 2.days.ago) }
    let!(:transaction_d) { create(:transaction, transaction_date: 3.days.ago) }

    describe ".date_range" do
      it { expect(described_class.date_range(1.day.ago, Date.today)).to match_array([transaction_a, transaction_b]) }
      it { expect(described_class.date_range(3.day.ago, 1.day.ago)).to  match_array([transaction_b, transaction_c, transaction_d]) }
    end
  end
end

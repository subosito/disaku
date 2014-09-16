require 'rails_helper'

RSpec.describe Category, :type => :model do
  context "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:transactions) }
  end

  context "validations" do
    it { is_expected.to enumerize(:category_type).in(:income, :expense, :credit) }
  end

  describe ".grouped_options_for_select" do
    let!(:category_a) { create(:category, :expense) }
    let!(:category_b) { create(:category, :income) }
    let!(:category_c) { create(:category, :credit) }

    it { expect(described_class.grouped_options_for_select.length).to eq(3) }
    it { expect(described_class.grouped_options_for_select).to include({ "Expense" => [category_a] }) }
    it { expect(described_class.grouped_options_for_select).to include({ "Income"  => [category_b] }) }
    it { expect(described_class.grouped_options_for_select).to include({ "Credit"  => [category_c] }) }
  end
end

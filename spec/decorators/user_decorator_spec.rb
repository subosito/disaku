require 'rails_helper'

describe UserDecorator do
  include Draper::ViewHelpers

  let(:user)   { create(:user) }
  let(:object) { described_class.decorate(user) }

  describe "#accounts_grouped_options" do
    let!(:neighbour) { create(:user) }
    let!(:account_a) { create(:account, :cash,   user: user) }
    let!(:account_b) { create(:account, :saving, user: user) }
    let!(:account_c) { create(:account, :other,  user: user) }
    let!(:account_d) { create(:account, :cash,   user: neighbour) }

    it { expect(object.accounts_grouped_options.length).to eq(3) }
    it { expect(object.accounts_grouped_options).to include({ "Cash"   => [account_a] }) }
    it { expect(object.accounts_grouped_options).to include({ "Saving" => [account_b] }) }
    it { expect(object.accounts_grouped_options).to include({ "Other"  => [account_c] }) }
    it { expect(object.accounts_grouped_options).to_not include({ "Cash" => [account_d] }) }
  end

  describe "#categories_grouped_options" do
    let!(:neighbour)  { create(:user) }
    let!(:category_a) { create(:category, :expense, user: user) }
    let!(:category_b) { create(:category, :income,  user: user) }
    let!(:category_c) { create(:category, :credit,  user: user) }
    let!(:category_d) { create(:category, :income,  user: neighbour) }

    it { expect(object.categories_grouped_options.length).to eq(3) }
    it { expect(object.categories_grouped_options).to include({ "Expense" => [category_a] }) }
    it { expect(object.categories_grouped_options).to include({ "Income"  => [category_b] }) }
    it { expect(object.categories_grouped_options).to include({ "Credit"  => [category_c] }) }
    it { expect(object.categories_grouped_options).to_not include({ "Income" => [category_d] }) }
  end
end

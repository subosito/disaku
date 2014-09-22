require 'rails_helper'

RSpec.describe Category, :type => :model do
  context "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:transactions) }
  end

  context "validations" do
    it { is_expected.to enumerize(:category_type).in(:income, :expense, :credit) }
  end
end

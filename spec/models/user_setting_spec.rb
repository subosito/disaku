require 'rails_helper'

RSpec.describe UserSetting, :type => :model do
  context "validations" do
    it { is_expected.to enumerize(:language).in(:en, :id) }
    it { is_expected.to validate_presence_of(:monthly_budget) }
    it { is_expected.to validate_numericality_of(:monthly_budget).is_greater_than_or_equal_to(0) }
  end
end

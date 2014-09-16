require 'rails_helper'

RSpec.describe Role, :type => :model do
  context "associations" do
    it { is_expected.to have_and_belong_to_many(:users) }
    it { is_expected.to belong_to(:resource) }
  end
end

require 'rails_helper'

RSpec.describe Transaction, :type => :model do
  it { is_expected.to belong_to(:account) }
  it { is_expected.to belong_to(:category) }
end

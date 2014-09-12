require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, :type => :model do
  subject(:ability)   { Ability.new(user) }
  let(:user)          { create(:user) }
  let(:account)       { create(:account, user: user) }
  let(:other_account) { create(:account) }

  it { is_expected.to be_able_to(:manage, account) }
  it { is_expected.to_not be_able_to(:manage, other_account) }
end

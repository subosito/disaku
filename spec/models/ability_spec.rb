require 'rails_helper'
require 'cancan/matchers'

RSpec.describe Ability, :type => :model do
  subject(:ability)       { Ability.new(user) }
  let(:user)              { create(:user) }
  let(:account)           { create(:account, user: user) }
  let(:other_account)     { create(:account) }
  let(:category)          { create(:category, user: user) }
  let(:other_category)    { create(:category) }
  let(:transfer)          { create(:transfer, user: user) }
  let(:other_transfer)    { create(:transfer) }
  let(:transaction)       { create(:transaction, account: account) }
  let(:other_transaction) { create(:transaction) }

  it { is_expected.to be_able_to(:manage, account) }
  it { is_expected.to_not be_able_to(:manage, other_account) }
  it { is_expected.to be_able_to(:manage, category) }
  it { is_expected.to_not be_able_to(:manage, other_category) }
  it { is_expected.to be_able_to(:manage, transfer) }
  it { is_expected.to_not be_able_to(:manage, other_transfer) }
  it { is_expected.to be_able_to(:manage, transaction) }
  it { is_expected.to_not be_able_to(:manage, other_transaction) }
  it { is_expected.to be_able_to(:create, Transaction) }
end

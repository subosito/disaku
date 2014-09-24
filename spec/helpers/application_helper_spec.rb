require 'rails_helper'

RSpec.describe ApplicationHelper, :type => :helper do
  describe "#current_user" do
    let(:user) { build(:user) }

    before do
      helper.instance_variable_set :@current_user, user
      allow(helper).to receive(:user_signed_in?).and_return(true)
    end

    it { expect(helper.current_user).to be_decorated_with(UserDecorator) }
    it { expect(helper.current_user.object).to eq(user) }
  end

  describe "#current_language" do
    let(:user) { create(:user) }

    context "default language" do
      before do
        allow(helper).to receive(:current_user).and_return(nil)
      end

      it { expect(helper.current_language).to eq(Setting.language) }
    end

    context "user language" do
      before do
        user.settings.language = :id
        allow(helper).to receive(:current_user).and_return(user)
      end

      it { expect(helper.current_language).to eq(:id) }
    end
  end
end

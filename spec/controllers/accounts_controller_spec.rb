require 'rails_helper'

RSpec.describe AccountsController, :type => :controller do
  let(:user)       { create(:user) }
  let(:other_user) { create(:user) }

  before { sign_in(user) }

  describe "#index" do
    let!(:accounts)  { create_list(:account, 2, user: user) }
    let!(:others)    { create_list(:account, 2, user: other_user) }

    def do_request
      get :index
    end

    before { do_request }

    it { expect(response.status).to eq(200) }
    it { expect(assigns(:accounts).count).to eq(accounts.count) }
    it { expect(assigns(:accounts)).to match_array(accounts) }

    it_should_behave_like "protected resources"
  end

  describe "#new" do
    def do_request
      get :new
    end

    before { do_request }

    it { expect(assigns(:account)).to be_present }
    it { expect(response).to render_template(:new) }

    it_should_behave_like "protected resources"
  end

  describe "#create" do
    let(:attributes) { attributes_for(:account) }

    def do_request
      post :create, account: attributes
    end

    before { do_request }

    context "success" do
      it { expect(assigns(:account)).to eq(Account.last) }
      it { expect(response).to redirect_to(accounts_path) }
    end

    context "failure" do
      let(:attributes) { { initial_amount: "abc" } }

      it { expect(response).to render_template(:new) }
    end

    it_should_behave_like "protected resources"
  end

  describe "#edit" do
    let!(:account) { create(:account, user: user) }

    def do_request
      get :edit, id: account.id
    end

    before { do_request }

    context "own account" do
      it { expect(assigns(:account)).to eq(account) }
      it { expect(response).to render_template(:edit) }
    end

    context "other user's account" do
      let!(:account) { create(:account, user: other_user) }

      it { expect(response).to redirect_to(root_path) }
      it { expect(flash[:alert]).to_not be_nil }
    end

    it_should_behave_like "protected resources"
  end

  describe "#update" do
    let!(:account)   { create(:account, user: user) }
    let(:attributes) { attributes_for(:account, initial_amount: 25) }

    def do_request
      put :update, id: account.id, account: attributes
    end

    before { do_request }

    context "success" do
      it { expect(account.reload).to eq(Account.last) }
      it { expect(response).to redirect_to(accounts_path) }
    end

    context "failure" do
      let(:attributes) { { initial_amount: "abc" } }

      it { expect(account.reload.initial_amount).to_not eq(attributes[:initial_amount]) }
      it { expect(response).to render_template(:edit) }
    end

    it_should_behave_like "protected resources"
  end

  describe "#destroy" do
    let!(:account) { create(:account, user: user) }

    def do_request
      delete :destroy, id: account.id
    end

    before { do_request }

    it { expect(response).to redirect_to(accounts_path) }
  end
end

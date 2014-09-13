shared_examples_for "protected resources" do
  let(:user) { User.new }

  before { do_request }

  it { expect(response).to redirect_to(new_user_session_path) }
  it { expect(flash[:alert]).to_not be_nil }
end


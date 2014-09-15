Disaku::Application.routes.draw do
  devise_for :users, :path_names => {
    :sign_in  => 'login',
    :sign_out => 'logout',
    :sign_up  => 'register'
  }

  scope :except => [:show] do
    resources :accounts
    resources :categories
    resources :transactions
    resources :transfers
  end

  resource :settings, only: [:show, :update] do
    post :filters, on: :collection
  end

  root 'accounts#index'
end

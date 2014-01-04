set :stage, :production
set :user, 'alto'
set :deploy_to, "/apps/#{fetch(:application)}"
set :bundle_dir, -> { shared_path.join('vendor', 'bundle') }
server '162.243.202.205', user: fetch(:user), roles: %w{app web db}

after :deploy, 'notify_rollbar'

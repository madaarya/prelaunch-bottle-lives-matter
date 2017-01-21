set :deploy_to, "/home/railsdev/apps/bottlelivesmatter"
set :branch, "master"
set :rails_env, "production"
set :rack_env, "production"
set :nginx_server_name, 'bottlelivesmatter.com'

server '138.197.68.79',
  user: 'railsdev',
  roles: %w{web app db},
  ssh_options: {
    user: 'railsdev',
    forward_agent: false,
    auth_methods: %w(publickey),
    # password: 'madasovia18'
  }

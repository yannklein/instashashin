require './app'
run Sinatra::Application

configure do
  set :protection, :except => [:json_csrf]
end

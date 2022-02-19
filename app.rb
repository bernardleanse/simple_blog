require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection'
require './setup_db_connection'

setup_db_connection()

class SimpleBlog < Sinatra::Base
  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to the Blog Site!!'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  run! if app_file == $0
end
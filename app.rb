require 'sinatra/base'
require 'sinatra/reloader'
require './lib/database_connection'
require './setup_db_connection'
require './lib/post'

setup_db_connection()

class SimpleBlog < Sinatra::Base
  enable :sessions, :method_override

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to the Blog Site!!'
  end

  get '/posts' do
    @posts = Post.all
    p @posts
    erb :'posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  post '/posts' do
    content = params['post-content']
    Post.create(content: content)
    redirect '/posts'
  end




  run! if app_file == $0
end
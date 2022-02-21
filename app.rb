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
    erb :'posts/index'
  end

  get '/posts/new' do
    erb :'posts/new'
  end

  get '/posts/:id/edit' do
    @post = Post.find(id: params['id'])
    erb :'posts/edit'
  end

  post '/posts' do
    content = params['post-content']
    Post.create(content: content)
    redirect '/posts'
  end

  patch '/posts/:id' do
    Post.update(id: params['id'], content: params['post-content'])
    redirect '/posts'
  end

  delete '/posts/:id/delete' do
    Post.delete(id: params['id'])
    redirect '/posts'
  end
  
  run! if app_file == $0
end
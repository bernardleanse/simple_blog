require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/reloader'
require './lib/database_connection'
require './setup_db_connection'
require './lib/post'
require './lib/user'

setup_db_connection()

class SimpleBlog < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Welcome to the Blog Site!!'
  end

  get '/posts' do
    @user = User.find(id: session[:user_id])
    @posts = Post.all.reverse
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
    if session[:user_id]
      Post.create(content: content, user_id: session[:user_id])
      redirect '/posts'
    else
      flash[:notice] = "You're not logged in!"
      redirect '/posts'
    end
  end

  patch '/posts/:id' do
    Post.update(id: params['id'], content: params['post-content'])
    redirect '/posts'
  end

  delete '/posts/:id/delete' do
    Post.delete(id: params['id'])
    redirect '/posts'
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    begin
      user = User.create(username: params['username'], password: params['password'], confirm_password: params['confirm-password'])
    rescue PG::UniqueViolation
      flash[:notice] = "Someone already has that username, please try another."
      redirect '/users/new'
    rescue RuntimeError then "Passwords don't match"
      flash[:notice] = "Passwords don't match, try again."
      redirect '/users/new'
    end
    
    flash[:notice] = 'Registration Successful, You can now login.' if user.is_a? User
    redirect '/posts'
  end

  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(username: params[:username], password: params[:password])
    if user
      flash[:notice] = "Login Successful!"
      session[:user_id] = user.id
      redirect '/posts'
    else
      flash[:notice] = "Check Login Details"
      redirect '/sessions/new'
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:notice] = 'Successfully Logged Out'
    redirect '/posts'
  end
  
  run! if app_file == $0
end
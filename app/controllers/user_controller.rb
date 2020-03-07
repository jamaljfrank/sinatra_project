class UserController < ApplicationController
  
  
  get '/signup' do
    if logged_in?
      redirect '/games'
    else
      erb :'/users/signup'
    end
  end
      
  post '/signup' do
    user = User.find_by(:email => params[:email]) #account exists?
    if user
      flash[:error] = "Email already exists."
      redirect '/login'
    elsif
      !params[:username].blank? && !params[:email].blank? && !params[:password].blank?
      @user = User.create(params)
      @user.save
      session[:user_id] = @user.id
      redirect "/games"
    else
      flash[:error] = "Invalid Sign Up Credentials"
      redirect "/signup"
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect '/games'
    else
      flash[:error] = "Invalid Login Credentials"
      redirect '/login'
    end
  end

  get '/logout' do 
    logout
  end
end






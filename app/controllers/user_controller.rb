class UserController < ApplicationController
  
  
  get '/signup' do
    if logged_in?
      redirect '/games'
    else
      erb :'/users/signup'
    end
  end
      
  post '/signup' do
    if !params[:username].empty? && !params[:email].empty? && !params[:password].empty?
      @user = User.create(params)
      @user.save
      session[:user_id] = @user.id
      redirect "/games"
    else
      redirect "/signup"
    end
  end

  get '/login' do
    erb :'users/login'
  end

  post '/login' do
    user = User.find_by(:username => params[:username])
    if user != nil
        session[:user_id] = user.id
        redirect '/games'
     else
        redirect '/login'
     end
  end

  get '/logout' do 
    logout
  end
end






class ApplicationController < Sinatra::Base

    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "project"
    end

    get '/' do 
        redirect '/login'
    end

    helpers do
        def logged_in?
          !!current_user
        end
    
        def current_user
          @user ||= User.find(session[:user_id]) if session[:user_id]
        end

        def logout
            session.clear
        end
    end
end

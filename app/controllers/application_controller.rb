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

        def verify_action
            if !logged_in?
                redirect '/login'
            end
        end

        def logout
            session.clear
            redirect '/login'
        end

        def find_game
            @game = Game.find(params[:id])
        end

        def valid_input? #For games
            !params[:name].blank? && !params[:console].blank? && !params[:players].blank?
        end

        
            


    end
end

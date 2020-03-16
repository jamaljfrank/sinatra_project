require 'sinatra/base'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

    
    configure do 
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "project"
        register Sinatra::Flash
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
                flash[:error] = "Must be logged in."
                redirect '/login'
            end
        end

        def logout
            session.clear
            redirect '/login'
        end

        def valid_game?(redirect_path)
            if params[:name].blank? || params[:console].blank? || params[:players].blank?
             flash[:error] = "Invalid game input"
             redirect redirect_path
            end
        end

        def find_game
            @game = Game.find(params[:id])
        end

        def game_params
            {name: params[:name], console: params[:console], players: params[:players]}
        end

        
    end


        

        
    
end

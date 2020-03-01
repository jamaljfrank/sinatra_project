class GamesContoller < ApplicationController 

    get '/games' do 
        if logged_in?
            @games = Game.all
            erb :'games/user_library'
        else
            redirect to '/login'
        end
    end
        
    

    get '/games/new' do 
        if logged_in?
            erb :'games/new_game'
        else
            redirect "/login"
        end
    end


    get '/games/:id/edit' do 
        if logged_in?
            erb :'games/edit_game'
        else
            redirect "/login"
        end
    end

    post '/games' do
        user = User.find_by_id(session[:user_id])
        if !params[:name].empty?
            @game = Game.create(:params)
            redirect "/games"
        else
            redirect "/games/new"
        end
     end
  end




    

end


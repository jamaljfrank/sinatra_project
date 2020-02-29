class GamesContoller < ApplicationController 

    get '/games' do 
        "Games Index, #{session[:email]}"
        
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




    

end


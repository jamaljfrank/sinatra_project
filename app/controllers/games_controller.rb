class GamesContoller < ApplicationController 

    get '/games' do 
        verify_action
        @games = Game.all
        erb :'games/user_library'
    end
        
    

    get '/games/new' do 
        verify_action
        erb :'games/new_game'
    end


    get '/games/:id/edit' do 
        verify_action
        @game = Game.find_by_id(params[:id])
        erb :'games/edit_game'
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


class GamesController < ApplicationController 
    
    get '/games' do 
        verify_action
        erb :'games/index'
    end

    get '/games/new' do 
        verify_action
        erb :'games/new'
    end

    post '/games' do
        
        valid_game?("/games")
        current_user.games.create(game_params)    
        redirect "/games"
       
        
    end

    get "/games/:id" do
        verify_action
        find_game
        
        erb :"games/show"
    end


    get '/games/:id/edit' do 
        verify_action
        find_game
        if @game.user == current_user
            erb :'games/edit'
        else
            flash[:error] = "Unauthorized User"
            redirect '/games'
        end
    end

    patch "/games/:id" do
        verify_action
        find_game
        valid_game?("/games/#{@game.id}/edit")
        @game.update(game_params)
        redirect "/games"
    end
  

    

    delete "/games/:id" do
        verify_action
        find_game
        if  @game.user == current_user
            @game.destroy
            redirect "/games"
        else
            flash[:error] = "Unauthorized Deletion"
            redirect "/games"
        end
    end
end







    




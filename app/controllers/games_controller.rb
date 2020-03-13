class GamesController < ApplicationController 

    get '/games' do 
        verify_action
        erb :'games/index'
    end
        
    get '/games/console' do
        verify_action
        erb :'games/sort_console'
    end

    get '/games/players' do
        verify_action
        erb :'games/sort_players'
    end

    get '/games/new' do 
        verify_action
        erb :'games/new'
    end

    post '/games/new' do
        
        if valid_input?
            current_user.games.create(name: params[:name], console: params[:console], players: params[:players])    
            redirect "/games"
        else
            flash[:error] = "Invalid game input"
            redirect "/games"
        end
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
        if valid_input?
            @game.update(name: params[:name], console: params[:console], players: params[:players])
            redirect "/games"
        else
            flash[:error] = "Invalid Edit. Fill in all fields."
            redirect "/games/#{@game.id}/edit"
        end
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







    




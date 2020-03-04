class GamesContoller < ApplicationController 

    get '/games' do 
        verify_action
        @games = Game.all
        erb :'games/user_library'
    end
        
    

    get '/games/add' do 
        verify_action
        erb :'games/add_game'
    end

    post '/games/add' do
        if valid_input?
            game = Game.create(name: params[:name], console: params[:console], players: params[:players])
            game.user = current_user
            game.save
            redirect "/games"
        else
            redirect "/games"
        end
    end

    get "/games/:id/show" do
        verify_action
        find_game
        
        erb :"games/show_game"
    end


    get '/games/:id/edit' do 
        verify_action
        find_game
        if @game.user == current_user
            erb :'games/edit_game'
        else
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
            redirect "/games/#{@game.id}/edit"
        end
    end
  

    post '/games' do
        user = User.find(session[:user_id])
        if !params[:name].empty?
            @game = Game.create(:params)
            redirect "/games"
        else
            redirect "/games/new"
        end
    end

    delete "/games/:id" do
        verify_action
        find_game
        if  @game.user == current_user
            @game.destroy
            redirect "/games"
        else
            redirect "/games"
        end
    end
end







    




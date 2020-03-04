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
        if !params[:name].blank? && !params[:console].blank? && !params[:players].blank?
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
        @game = Game.find(params[:id])
        
        erb :"games/show_game"
    end


    get '/games/:id/edit' do 
        verify_action
        @game = Game.find_by_id(params[:id])
        erb :'games/edit_game'
    end

    patch "/games/:id" do
        verify_action
        @game = Game.find(params[:id])
        if !params[:name].empty? && !params[:console].empty? && !params[:players].empty?
            @game.update(name: params[:name], console: params[:console], players: params[:players])
            redirect "/games"
        else
            redirect "/games/#{@game.id}/edit"
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

    delete "/games/:id" do
        verify_action
        @game = Game.find(params[:id])
        if 
            @game.destroy
            redirect "/games"
        else
            redirect "/games"
        end
    end
end







    




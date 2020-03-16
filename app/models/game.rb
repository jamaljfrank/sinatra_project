class Game < ActiveRecord::Base
    belongs_to :user
    
    #validate presence of :name
end


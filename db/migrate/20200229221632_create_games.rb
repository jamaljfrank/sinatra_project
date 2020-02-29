class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :name
      t.string :system
      t.integer :players
      t.integer :user_id
    end
  end
end

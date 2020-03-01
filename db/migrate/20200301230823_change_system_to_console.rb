class ChangeSystemToConsole < ActiveRecord::Migration[5.2]
  def change
    rename_column :games, :system, :console
  end
end

class RemovePointsFromUser < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :points, :int
  end
end

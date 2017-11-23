class ChangeColumn < ActiveRecord::Migration[5.1]
  def up
  	change_column :posts, :signed, :boolean, default: true
  end
end

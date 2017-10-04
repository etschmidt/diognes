class AddColumnsToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :signed, :boolean, default: false
    add_column :posts, :dated, :boolean, default: true
  end
end

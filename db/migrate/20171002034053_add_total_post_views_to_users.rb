class AddTotalPostViewsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :total_post_views, :integer
  end
end

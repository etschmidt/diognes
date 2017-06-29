class RemoveImpressionsCountFromUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :impressions_count, :int
  end
end

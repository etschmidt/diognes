class AddImpressionsCountToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :impressions_count, :int
  end
end

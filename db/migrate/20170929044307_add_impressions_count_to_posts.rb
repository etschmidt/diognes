class AddImpressionsCountToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :impressions_count, :int
  end
end

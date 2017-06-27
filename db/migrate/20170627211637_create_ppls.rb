class CreatePpls < ActiveRecord::Migration[5.1]
  def change
    create_table :ppls do |t|

      t.timestamps
    end
  end
end

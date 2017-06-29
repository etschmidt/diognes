class CreateConns < ActiveRecord::Migration[5.1]
  def change
    create_table :conns do |t|

      t.timestamps
    end
  end
end

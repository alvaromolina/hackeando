class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :name
      t.string :type

      t.timestamps null: false
    end
  end
end

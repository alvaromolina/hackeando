class CreateComplaints < ActiveRecord::Migration
  def change
    create_table :complaints do |t|
      t.string :title
      t.text :detail
      t.references :entity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

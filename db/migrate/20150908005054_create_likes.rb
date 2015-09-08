class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :complaint, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :email
      t.timestamps null: false
    end
  end
end

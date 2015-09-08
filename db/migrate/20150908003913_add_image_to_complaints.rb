class AddImageToComplaints < ActiveRecord::Migration
  def up
    add_attachment :complaints, :image
  end

  def down
    remove_attachment :complaints, :image
  end
end

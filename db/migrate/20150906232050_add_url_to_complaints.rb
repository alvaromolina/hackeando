class AddUrlToComplaints < ActiveRecord::Migration
  def change
    add_column :complaints, :url, :text
  end
end

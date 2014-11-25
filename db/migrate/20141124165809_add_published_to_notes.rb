class AddPublishedToNotes < ActiveRecord::Migration
  def change
  	add_column :notes, :published, :boolean, nil: false, default: true
  end
end

class AddColumnsToCommunities < ActiveRecord::Migration
  def change
  	add_column :communities, :name, :string
  	add_column :communities, :description, :string
  end
end

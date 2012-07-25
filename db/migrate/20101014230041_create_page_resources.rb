class CreatePageImages < ActiveRecord::Migration
  def change
    create_table Refinery::PageResource.table_name, :id => false do |t|
      t.integer :resource_id
      t.integer :page_id
      t.integer :position
    end

    add_index Refinery::PageResource.table_name, :resource_id
    add_index Refinery::PageResource.table_name, :page_id
  end
end

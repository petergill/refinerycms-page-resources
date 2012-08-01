class ChangePageResourceToPolymorphic < ActiveRecord::Migration
  def change
    add_column Refinery::PageResource.table_name, :page_type, :string, :default => "page"
  end
end

class TranslatePageImageCaptions < ActiveRecord::Migration
  def change
    add_column Refinery::ResourcePage.table_name, :id, :primary_key
  end

end

class AddMetaToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :description, :text
    add_column :vendors, :image_url, :string
  end
end

class CreateCenterVendors < ActiveRecord::Migration
  def change
    create_table :center_vendors do |t|
      t.integer :center_id
      t.integer :vendor_id

      t.timestamps
    end
  end
end

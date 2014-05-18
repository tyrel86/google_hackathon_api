class CreateUserVendorStatuses < ActiveRecord::Migration
  def change
    create_table :user_vendor_statuses do |t|
      t.integer :vendor_id
      t.integer :user_id
      t.boolean :is_complete

      t.timestamps
    end
  end
end

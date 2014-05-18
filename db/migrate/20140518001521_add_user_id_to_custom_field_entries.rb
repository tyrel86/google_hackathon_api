class AddUserIdToCustomFieldEntries < ActiveRecord::Migration
  def change
    add_column :custom_field_entries, :user_id, :integer
  end
end

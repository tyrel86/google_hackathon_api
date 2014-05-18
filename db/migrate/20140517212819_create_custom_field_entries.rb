class CreateCustomFieldEntries < ActiveRecord::Migration
  def change
    create_table :custom_field_entries do |t|
      t.integer :custom_field_id
      t.text :value_text
      t.string :value_string
      t.boolean :value_bool
      t.float :value_float
      t.integer :value_integer

      t.timestamps
    end
  end
end

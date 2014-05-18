class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :is_admin
      t.boolean :is_volunteer
      t.boolean :is_survivor

      t.timestamps
    end
  end
end

class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :instruction_id
      t.integer :user_id
      t.string :body
      t.timestamps
    end
  end
end

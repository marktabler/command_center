class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :instruction_id
      t.string :body
      t.boolean :published, default: false

      t.timestamps
    end
  end
end

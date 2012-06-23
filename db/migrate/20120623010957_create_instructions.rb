class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.integer :user_id
      t.string :ferret_type
      t.string :params
      t.datetime :last_run, default: "2012-01-01"

      t.timestamps
    end
  end
end

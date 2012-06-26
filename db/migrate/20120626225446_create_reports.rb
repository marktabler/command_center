class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :body
      t.string :subject
      t.datetime :sent_at
      t.integer :user_id

      t.timestamps
    end
  end
end

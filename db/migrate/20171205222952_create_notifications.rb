class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.references :user_from, foreign_key: true
      t.references :user_to, foreign_key: true
      t.references :sport, foreign_key: true
      t.string :content
      t.timestamps
    end
  end
end

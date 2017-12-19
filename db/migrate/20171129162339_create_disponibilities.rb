class CreateDisponibilities < ActiveRecord::Migration[5.1]
  def change
    create_table :disponibilities do |t|
      t.integer :day
      t.integer :morning
      t.integer :afternoon
      t.integer :night
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

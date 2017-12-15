class AddViewedToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :viewed, :boolean
  end
end

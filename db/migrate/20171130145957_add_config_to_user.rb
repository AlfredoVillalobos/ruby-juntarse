class AddConfigToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :config, :boolean
  end
end

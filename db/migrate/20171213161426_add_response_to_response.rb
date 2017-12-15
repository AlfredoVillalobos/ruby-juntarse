class AddResponseToResponse < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :response, :integer
  end
end

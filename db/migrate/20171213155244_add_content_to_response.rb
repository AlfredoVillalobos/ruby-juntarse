class AddContentToResponse < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :content, :string
  end
end

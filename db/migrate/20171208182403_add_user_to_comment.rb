class AddUserToComment < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :user, foreign_key: true
    add_column :comments, :from, :integer
    add_column :comments, :content, :string
  end
end

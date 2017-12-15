class AddUsersToMessages < ActiveRecord::Migration[5.1]
  def change
    add_reference :messages, :user_to, foreign_key: true
    add_reference :messages, :user_from, foreign_key: true
  end
end

class AddExperticeToUserSport < ActiveRecord::Migration[5.1]
  def change
    add_column :user_sports, :expertice, :integer
  end
end

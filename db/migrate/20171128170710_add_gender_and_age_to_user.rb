class AddGenderAndAgeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gender, :integer
    add_column :users, :age, :integer
  end
end

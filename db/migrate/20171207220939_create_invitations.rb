class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.references :from
      t.references :to
      t.references :sport, foreign_key: true
      t.string :content
      t.timestamps
    end
  end
end

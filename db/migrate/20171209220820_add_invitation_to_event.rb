class AddInvitationToEvent < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :invitation, foreign_key: true
  end
end

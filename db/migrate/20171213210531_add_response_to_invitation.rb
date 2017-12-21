class AddResponseToInvitation < ActiveRecord::Migration[5.1]
  def change
    add_column :invitations, :has_response, :boolean, :default => false
  end
end

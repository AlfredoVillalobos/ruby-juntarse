class Invitation < ApplicationRecord
  belongs_to :from, class_name: 'User', foreign_key: :from_id
  belongs_to :to, class_name: 'User', foreign_key: :to_id
  belongs_to :sport
  has_one :event, dependent: :destroy
  has_one :response, dependent: :destroy

  def self.invite_user(current_user, users, sport_id, message, invitation_content)
    users.each do |value|
      i = Invitation.create(from_id: current_user.id, to_id: value.to_i,
                            sport_id: sport_id, content: invitation_content)
      Event.create(user_id: value.to_i, message: message,
                   invitation_id: i.id, viewed: false)
    end
  end
end

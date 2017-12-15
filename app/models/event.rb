class Event < ApplicationRecord
  belongs_to :user
  belongs_to :invitation

  def self.count_unviewed_events(current_user)
    current_user.events.order(updated_at: :desc)
                .where(viewed: false).count
  end

  def self.last_events(current_user, limit)
    current_user.events.order(updated_at: :desc)
                .where(viewed: false).limit(limit)
  end
end

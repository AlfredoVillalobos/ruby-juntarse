
# deportes por usuario 
class UserSport < ApplicationRecord
  belongs_to :user
  belongs_to :sport

  def self.create_or_update(sports, user_id)
    sports_id = []
    sports.each do |key, value|
      user_sport = UserSport.where(user_id: user_id, sport_id: key.to_i)[0] ||
                   UserSport.create(user_id: user_id, sport_id: key.to_i,
                                    expertice: value.to_i)
      sports_id << key.to_i
      user_sport.update(user_id: user_id, sport_id: key.to_i,
                        expertice: value.to_i)
    end
    UserSport.where(user_id: user_id).where.not(sport_id: sports_id).destroy_all
  end

  def self.dedupe
    grouped = all.group_by{|model| [model.user_id,model.sport_id] }
    grouped.each_value do |duplicates|
      first_one = duplicates.shift
      duplicates.each{|double| double.destroy} 
    end
  end
  
end

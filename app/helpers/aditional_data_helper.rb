# helper adiional data
module AditionalDataHelper
  def add_disponibilities(disponibilities)
    disponibilities.each do |key, value|
      d = Disponibility.where(day: key.to_i, user_id: current_user.id)[0] ||
          Disponibility.new(day: key.to_i, user_id: current_user.id)
      d.morning = value.include?('0') ? 1 : nil
      d.afternoon = value.include?('1') ? 1 : nil
      d.night = value.include?('2') ? 1 : nil
      d.save
    end
  end
end

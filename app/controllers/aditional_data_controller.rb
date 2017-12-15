# datos adicionales de inicio
class AditionalDataController < ApplicationController
  include AditionalDataHelper
  before_action :authenticate_user!

  def steps
    redirect_to dashboard_pages_path if current_user.config?
    @sports = Sport.left_outer_joins(:user_sports).distinct
                   .select('sports.*, user_sports.expertice').group('id')
    @user_sport = UserSport.where(user_id: current_user.id)
  end

  def choose_sports
    sports = params['sports']
    UserSport.create_or_update(sports, current_user.id) if sports.present?
  end

  def choose_gender_and_age
    @user = User.find(current_user.id)
    @user.update(gender: params['gender'].to_i, age: params['age'].to_i)
  end

  def chose_disponibility
    add_disponibilities(params['disponibilities'])
    @disponibilities = current_user.disponibilities
    @sports = current_user.sports
    current_user.config = true
    current_user.save
    redirect_to dashboard_pages_path
  end
end

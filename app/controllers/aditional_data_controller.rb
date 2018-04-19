# datos adicionales de inicio
class AditionalDataController < ApplicationController
  include AditionalDataHelper
  before_action :authenticate_user!
  before_action :set_action

  def steps
    redirect_to dashboard_pages_path if current_user.config? && @action != 'edit_profile'
    @sports = Sport.left_outer_joins(:user_sports).distinct
                   .select('sports.*, user_sports.expertice').group('id')
    @user_sport = UserSport.where(user_id: current_user.id)
  end

  def choose_sports
    sports = params['sports']
    UserSport.create_or_update(sports, current_user.id) if sports.present?
    return if params['action_sender'] == 'edit_profile' # edit profile
  end

  def choose_gender_and_age
    @user = User.find(current_user.id)
    @user.update(gender: params['gender'].to_i, age: params['age'].to_i)
    @action
  end

  def choose_disponibility
    add_disponibilities(params['disponibilities']) if params['disponibilities'].present?
    @disponibilities = current_user.disponibilities
    @sports = current_user.sports
    current_user.config = true if current_user.disponibilities.present?
    current_user.save
    redirect_to dashboard_pages_path if @action != 'edit_profile'
  end

  private

  def set_action
    @action = params['action_sender']
  end
end

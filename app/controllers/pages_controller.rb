# controlador general de las vistas
class PagesController < ApplicationController
  before_action :authenticate_user!, except: %i[index]
  before_action :config_complete?, except: %i[index]

  def index
    if current_user.present?
      redirect_to dashboard_pages_path if current_user.config?
    end
  end

  def react
    @sports = Sport.all
  end

  def dashboard
    redirect_to steps_aditional_data_path unless current_user.config?
    age_from = params['ageRange'].present? ? params['ageRange'][0].to_i : current_user.age - 7
    age_to = params['ageRange'].present? ? params['ageRange'][1].to_i : current_user.age + 7
    km = params['km'].present? ? params['km'].to_i : 20
    if params['sports'].present?
      sports = params['sports'].permit!.to_h.map { |key, _value| key.to_i }.join(', ')
    else
      sports = current_user.sports.pluck(:sport_id).map(&:inspect).join(', ')
    end
    gender = params['gender'].present? ? params['gender'] : current_user.gender
    users = User.left_outer_joins(:user_sports).distinct.select('users.*')
                .where("user_sports.sport_id in (#{sports})")
    @@sports = Sport.where("id in (#{sports})")
    @users = users.near([-33.440191, -70.658969],
                        km, units: :km)
                  .where(gender: gender).where('age >= ?', age_from)
                  .where('age <= ?', age_to)
                  .where.not(id: current_user)
    @hash = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
    @sports = current_user.sports
    respond_to do |format|
      format.html { render :dashboard }
      format.json { render json: { users_map: @hash.to_json, users: @users.to_json } }
    end
  end

  def searched_users
    users_id = []
    if params['users'].present?
      params['users'].each do |_key, value|
        users_id.push(value['id'])
      end
    end
    @users = User.where(id: users_id)
    @sports = @@sports
    @sport_selected = params['sportSelected'].to_i
    @users_selected = params['usersSelected']
  end

  def invitations
    @invitations = Invitation.where(to: current_user).or(Invitation.where(from: current_user)).order(created_at: :desc)
    @invitation = Invitation.find(params['invitation_id']) || Invitation.find(@invitations.first.id)
    @invitation.event.viewed = true
    @invitation.event.save
    user_position = [current_user.latitude, current_user.longitude]
    user_invitation_position = [@invitation.from.latitude, @invitation.from.longitude]
    @distance_from_user = Geocoder::Calculations
                          .distance_between(user_position,
                                            user_invitation_position,
                                            options = { units: :km })
  end

  def edit_profile
    if request.post?
      current_user.image = params['image'] if params['image'].present?
      current_user.save
    end
    @sports = Sport.left_outer_joins(:user_sports).distinct
                   .select('sports.*, user_sports.expertice').group('id')
    @user_sport = UserSport.where(user_id: current_user.id)
    @action = 'edit_profile'
    @user = current_user
  end

  private

  def config_complete?
    redirect_to steps_aditional_data_path unless current_user.config?
  end

end

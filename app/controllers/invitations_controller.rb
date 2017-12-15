# invitaciones
class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invitation, only: %i[show_post response_invitation]
  def invite_users
    users = params['users']
    @sport = params['sport']
    @users = User.where(id: users)
  end

  def create
    sport_id = params['sport']
    message = 'Tienes una nueva invitación para jugar'
    Invitation.invite_user(current_user, params['users'], sport_id, message,
                           params['content'])
  end

  def show_post() end

  def response_invitation
    @invitation.has_response = true
    @invitation.event.viewed = true
    @invitation.event.save
    @invitation.save
    Response.create(invitation: @invitation, content: params['content'],
                    response: params['response'])
    respond_to do |format|
      events = Event.count_unviewed_events(current_user)
      format.json { render json: events }
    end
  end

  private

  def set_invitation
    @invitation = Invitation.find(params[:id])
  end
end

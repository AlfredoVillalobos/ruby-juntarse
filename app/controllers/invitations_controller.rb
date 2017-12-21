# invitaciones
class InvitationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_invitation,
                only: %i[show_invitation show_response response_invitation]
  before_action :event_viewed, only: %i[show_invitation show_response]

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

  def show_invitation
    @events = Event.count_unviewed_events(current_user)
  end

  def show_response
    @events = Event.count_unviewed_events(current_user)
  end

  def response_invitation
    @invitation.has_response = true
    @invitation.event.viewed = true
    @invitation.event.save
    @invitation.save
    Response.create(invitation: @invitation, content: params['content'],
                    response: params['response'])
    respond_to do |format|
      Event.create!(message: 'Han respondido a tu invitación',
                    user: @invitation.from, invitation: @invitation)
      format.json { render json: @invitation.from_id }
    end
  end

  private

  def set_invitation
    @invitation = Invitation.find(params[:invitation_id])
  end

  def event_viewed
    e = Event.find(params[:event_id])
    e.viewed = true
    e.save
  end
end

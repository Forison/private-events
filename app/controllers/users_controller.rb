class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_path
      log_in @user
    else
      render 'new'
    end
  end

  def show
     @invitation=Invite.new
     @user=User.all
     @hosting = current_user.events.all.order(date: :asc)
     @guesting = current_user.attended_events
  end

  def invite
    if Invite.find_by(event_id: params[:invitation][:event_id], invite: params[:invitation][:invite]).nil?
     invited= Invite.new(invite_params)
      if invited.save 
        flash[:success]="user #{ params[:invitation][:invite] } has been invited to event #{params[:invitation][:event_id]}"
        redirect_back fallback_location: invited
      else
      flash[:warning]="OOps !!! something went wrong"
      redirect_back fallback_location: invited
      end
    else
      flash[:warning]="user #{ params[:invitation][:invite] } are already invited to this event"
      redirect_back fallback_location: invited
    end

  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def invite_params
    params.require(:invitation).permit(:event_id,:invite)
  end
end

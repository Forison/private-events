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
    #  user = User.find(params[:id])
     @invite=Attendance.new
     @user=User.all
     @hosting = current_user.events.all.order(date: :asc)
     @guesting = current_user.attended_events
    #  @previous=current_user.events.where('date < ?', DateTime.now)
  end

  def invite
    set_invite= Attendance.find(params[:id])
    if set_invite.send_invite.include?(params[:invite])
      # params[:invite]=nil
      flash[:warning]="this person is already invited"
      redirect_back fallback_location: set_invite
    else
      set_invite.send_invite << params[:invite]
      set_invite.save 
      flash[:success]="invitation successful"
      # params[:invite]=nil
      redirect_back fallback_location: set_invite
    end 

  end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def invite_params
    params.require(:invite).permit( :user_id, :event_id, invite: [])
  end
end

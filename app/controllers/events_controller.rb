class EventsController < ApplicationController
  def index
    @event = Event.all
    @upcoming_event = Event.upcoming
    @past_event = Event.past

    @attendances = Attendance.all
    @attendance = Attendance.new
  end

  def new
    @event = Event.new
  end

  def create
    if params[:get] == nil 
      @event = current_user.events.build(event_params) 
      if @event.save
        flash[:success] = 'Event created successfully!'
        redirect_to root_path
      else

        flash[:danger] = 'failed to create event'
        redirect_to root_path
      end
    else  
      flash[:success] = "going to the event"
       redirect_to root_path
    end
  end

  # def attend
  #   @event = Event.find(params[:event_id])
  #   current_user.attendances << @event
  #   flash[:success] = 'You have joined the event!'
  #   redirect_to users_path(current_user)
  # end

  def show
    @event = Event.find(params[:id])
    @attendances = Attendance.all
    @attendance = Attendance.new
  end

  def attend
    @user = User.find(params[:attendance][:user_id])
    invitedby = @user.attendances.find_by(event_id: params[:attendance][:event_id]).invited_by
    @user.attendances.delete(@user.attendances.find_by(event_id: params[:attendance][:event_id]).id)
    @attendance = Attendance.new
    @event = Event.find(params[:attendance][:event_id])
    @attendance.user_id =  params[:attendance][:user_id]
    @attendance.event_id = params[:attendance][:event_id]
    @attendance.invitation = nil
    @attendance.invited_by = invitedby

    if @attendance.save

      flash[:success] = 'You have joined the event!'
      redirect_to users_path(current_user)
    else
      flash[:danger] = 'There was a problem :/'
    end
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :event_title, :description, :date)
  end
end

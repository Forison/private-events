class EventsController < ApplicationController

  def index
    @attendance = Attendance.new
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end
  def attend_event
    attend=current_user.attendances.build(attend_params)
    if attend.save
      flash[:success] = "thank you for being part of event #{attend.event_id} guest list!"
      redirect_back fallback_location: attend
    else
      flash[:warning] = "oops you are unable to join meeting!"
      redirect_back fallback_location: attend
    end
  end
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created successfully!"
      redirect_to users_show_url
    else
      render 'new'
    end
  end

  def show
    event = Event.find(params[:id])
    @attendees = event.attendees
  end

  private 
  def event_params
    params.require(:event).permit(:description, :date, :user_id)
  end
  def attend_params
    params.require(:attendance).permit(:event_id)
  end
end

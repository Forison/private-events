class EventsController < ApplicationController
  
  def index
    @events = Event.order(created: :desc)
  end

  def new
    @event = Event.new
  end

  def create
    # debugger
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created successfully!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @event=Event.find(3)
  end

  private 
  def event_params
    params.require(:event).permit(:description, :date)
  end
  
end

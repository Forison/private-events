class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event created successfully!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
  end

  def index
  end

  private 

  def event_params
    params.require(:event).permit(:description, :date, :user_id)
  end
end

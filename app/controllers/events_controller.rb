# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @event = Event.all
    @upcoming_event = Event.upcoming
    @past_event = Event.past
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
        render 'new'
      end
    else  
      flash.now[:success] = "going to the event"
      redirect_to root_path
    end
  end

  def attend
    @event = Event.find(params[:event_id])
    current_user.attendances << @event
    flash[:success] = 'You have joined the event!'
    redirect_to users_path(current_user)
  end

  def show
    @event = Event.all
    @upcoming_event = Event.upcoming
    @past_event = Event.past
    @attendance = Attendance.new
  end

  def index
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:user_id, :description, :date)
  end
end

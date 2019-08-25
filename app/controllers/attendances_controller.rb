# frozen_string_literal: true

class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end


  def attend
    @attendance = Attendance.new
    @event = Event.find(params[:attendance][:event_id])
    @attendance.user_id =  params[:attendance][:user_id] 
    @attendance.event_id = params[:attendance][:event_id]
    if @attendance.save
      flash[:success] = 'You have joined the event!'
      redirect_to users_path(current_user)
    else  
      flash[:danger] = "There was a problem :/"
    end
  end
end

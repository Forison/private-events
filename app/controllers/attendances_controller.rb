# frozen_string_literal: true

class AttendancesController < ApplicationController
  def new
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

  def invite
    @attendance = Attendance.new
    @user = User.find(params[:attendance][:user])
    @attendance.user_id =  params[:attendance][:user]
    @attendance.event_id = params[:attendance][:event_id]
    @attendance.invitation = true
    @attendance.invited_by = params[:attendance][:invited_by]

    if @attendance.save
      flash[:success] = "You have invited #{@user.name} to your event!"
      redirect_to users_path(current_user)
    else
      flash[:danger] = 'There was a problem :/'
    end
  end
end

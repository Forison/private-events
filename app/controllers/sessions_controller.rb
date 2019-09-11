# frozen_string_literal: true

class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      # && user.authenticate(params[:session][:password])
      flash[:success] = 'you are logged in'
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid email or password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
end

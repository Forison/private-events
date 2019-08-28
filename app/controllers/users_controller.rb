# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Welcome to Eventia !'
      redirect_to root_path
      log_in @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(session[:user_id])
    @events = Event.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end

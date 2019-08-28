class SessionsController < ApplicationController
  def new
    @user=User.new
  end
  def create
    user=User.find_by(name: params[:session][:name])
    if user
      log_in user
      flash[:success] = "you are logged in" 
      redirect_to root_path
    else
      flash[:success] = "name not valid" 
      redirect_back fallback_location: user
    end
  end
end

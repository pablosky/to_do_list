class ApiController < ApplicationController

  before_action :check_authentication,  :except => [:register_user]
  helper_method :current_user

  def register_user
    user = User.new(email: params[:email], password: params[:password])
    if user.save
      render :text => "User registered"
    else
      render :text => user.errors.full_messages
    end
  end

  #move this to applicationcontroller as a helper
  def check_authentication
    user = current_user
    unless user.present?
      render :text => "Invalid Access. Please register your user"
    end
  end

  def current_user
    User.where(email: params[:email], password: params[:password]).first
  end


end

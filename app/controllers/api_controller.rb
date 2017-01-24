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

  def create_to_do_list
    render json: current_user.create_to_do_list(params[:list_name])
  end

  def add_task
    render json: current_user.add_task(params[:list_name], params[:task_title], params[:task_description], params[:start_date], params[:end_date]).to_json
  end

  def mark_task
    render json: current_user.mark_task(params[:list_name], params[:task_title])
  end

  def user_tasks
    render json: current_user.tasks
  end

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

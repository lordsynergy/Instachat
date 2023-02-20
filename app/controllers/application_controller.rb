class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_users

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.where(id: cookies.signed[:user_id]).first

    if @current_user.nil?
      @current_user = User.create
      cookies.signed[:user_id] = current_user.id
    end

    @current_user
  end

  def set_users
    @online_users = User.where(online: true)
  end
end

class UsersController < ApplicationController
  def new
    if @current_user.nil?
      @current_user = User.create
      cookies.signed[:user_id] = current_user.id
    end

    redirect_to root_url
  end

  def destroy
    current_user.destroy

    redirect_to root_url
  end
end

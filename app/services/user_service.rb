class UserService
  def initialize(user:)
    @user = user
  end

  def is_online
    @user.update(online: true)
  end

  def is_offline
    @user.update(online: false)
  end

  def perform
    broadcast_user
  end

  private

  def broadcast_user
    ActionCable.server.broadcast 'online_status_channel', { user: render_user, user_id: @user.id }
  end

  def render_user
    ApplicationController.renderer.render(partial: 'users/user', locals: { user: @user })
  end
end

class OnlineStatusChannel < ApplicationCable::Channel
  def subscribed
    logger.info 'Subscribed to OnlineStatusChannel'

    stream_from 'online_status_channel'
    user_service = UserService.new(user: current_user)
    user_service.is_online
    user_service.perform
  end

  def unsubscribed
    logger.info 'Unsubscribed to OnlineStatusChannel'

    if ActionCable.server.connections.select { |con| con.current_user == current_user }.length == 0
      user_service = UserService.new(user: current_user)
      user_service.is_offline
      user_service.perform
    end
  end
end

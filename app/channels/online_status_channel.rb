class OnlineStatusChannel < ApplicationCable::Channel
  def subscribed
    logger.info 'Subscribed to OnlineStatusChannel'

    stream_from 'online_status_channel'

    speak('online' => true)
  end

  def unsubscribed
    logger.info 'Unsubscribed to UserStatusChannel'

    speak('online' => false)
  end

  def speak(data)
    logger.info "OnlineStatusChannel, speak: #{data.inspect}"

    UserService.new(user: current_user, online: data['online']).perform
  end
end

class OnlineStatusChannel < ApplicationCable::Channel
  def subscribed
    @list_name = 'current_users_nicknames'

    stream_from 'online_status'

    RedisInstance.redis_pool.with do |redis|
      redis.rpush(@list_name, nickname)
    end

    appear
  end

  def unsubscribed
    RedisInstance.redis_pool.with do |redis|
      redis.lrem(@list_name, 1, nickname)
    end

    appear
  end

  def appear
    @users = nicknames_list

    broadcast
  end

  private

  def nicknames_list
    RedisInstance.redis_pool.with do |redis|
      redis.lrange(@list_name, 0, -1)
    end
  end

  def broadcast
    ActionCable.server.broadcast('online_status', { users: @users.uniq })
  end

  def nickname
    current_user.nickname
  end
end

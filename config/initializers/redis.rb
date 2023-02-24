require 'connection_pool'

class RedisInstance
  def self.redis_pool
    @redis_pool ||= ConnectionPool::Wrapper.new(size: 5, timeout: 5) do
      Redis.new(url: ENV["REDIS_URL"])
    end
  end
end

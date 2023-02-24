class User < ApplicationRecord
  has_many :rooms
  before_create :generate_nickname

  def generate_nickname
    self.nickname = Faker::Name.first_name.downcase
  end
end

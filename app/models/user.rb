class User < ApplicationRecord
  has_many :comments

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = auth["info"]["email"]
      user.image_url = auth["info"]["image"]
      user.token = auth["credentials"]["token"]
    end
  end
end

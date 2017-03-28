class User < ApplicationRecord
#   def self.create_with_omniauth(auth)
#     create! do |user|
#       user.provider = auth["provider"]
#       user.uid = auth["uid"]
#       user.name = auth["info"]["name"]
#       user.email = auth["info"]["email"]
#       user.image_url = auth["info"]["image"]
#       user.token = auth["credentials"]["token"]
#     end
#   end

  include TheComments::User

  has_many :posts

  # IT'S JUST AN EXAMPLE OF ANY ROLE SYSTEM 
  def admin?
    self == User.first
  end

  # YOU HAVE TO IMPLEMENT YOUR ROLE POLICY FOR COMMENTS HERE
  def comments_admin?
    admin?
  end

  def comments_moderator? comment
    id == comment.holder_id
  end
end



class Repo < ApplicationRecord
  searchkick

    include TheComments::Commentable

  belongs_to :user

  # Denormalization methods
  # Check the documentation for information on advanced usage
  def commentable_title
    "Undefined Post Title"
  end

  def commentable_url
    "#"
  end

  def commentable_state
    "published"
  end
end

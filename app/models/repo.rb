class Repo < ApplicationRecord
  paginates_per 10
  acts_as_commentable
  searchkick
  has_many :comments
  default_scope -> { order('id') }
end

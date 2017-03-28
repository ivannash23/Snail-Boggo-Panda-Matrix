class Repo < ApplicationRecord
  searchkick
  belongs_to :user

  # Denormalization methods
 
end

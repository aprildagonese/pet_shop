class Shelter < ApplicationRecord
  belongs_to :store_shelters
  has_many :pets
end

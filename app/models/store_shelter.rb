class StoreShelters < ApplicationRecord
  has_many :stores
  has_many :shelters
end

class Store
  belongs_to :store_shelter
  has_many :pets, through: :store_shelters
  belongs_to :region
end

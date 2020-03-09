class Menuitem < ApplicationRecord
  belongs_to :foodtruck
  validates :Name, presence: true
  validates :price, presence: true
end

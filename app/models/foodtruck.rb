class Foodtruck < ApplicationRecord
  has_one_attached :cover
  has_many :menuitems, dependent: :destroy
  validates :Name, presence: true
  validates :Type, presence: true
  validates :Address, presence: true
  validates :Owner, presence: true
  validates :user_id, presence: true
end

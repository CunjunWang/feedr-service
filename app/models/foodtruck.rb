class Foodtruck < ApplicationRecord
    has_many :menuitems, dependent: :destroy
    validates :Name, presence: true
    validates :Type, presence: true
    validates :Address, presence: true
    validates :Owner, presence: true
end

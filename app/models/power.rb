class Power < ApplicationRecord
    has_many :heroine_powers
    has_many :heroines, through: :heroine_powers

    validates :name, presence: true
    validates :description, presence: true, uniqueness: true
end

class Power < ApplicationRecord    
    has_many :heroine_powers
    has_many :powers, through: :heroine_powers


    validates :name, presence: true
    validates :description, presence: true
end

class Power < ApplicationRecord

    has_many :heroine_powers
    has_many :heroines, through: :heroine_powers

    accepts_nested_attributes_for :heroine_powers

    def heroine_count
        self.heroines.count
    end

    # def heroine_ids=(ids)
    #     ids.each do |id|
    #         self.heroines << Heroine.find(id)
    #         self.save
    #     end
    # end

end

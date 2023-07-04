class Group < ApplicationRecord
    # associations

    # validations
    validates :name, presence: true, length: {in 1..25}
    validates :icon, presence: true
end

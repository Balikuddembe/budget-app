class User < ApplicationRecord
    # associations

    # validations
    validates :name, presence: true

end

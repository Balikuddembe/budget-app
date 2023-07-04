class User < ApplicationRecord
    # associations
    has_many :groups, class_name: 'Group', dependent: :destroy, foreign_key: 'user_id'
    has_many :expenses, class_name: 'Expense', dependent: :destroy, foreign_key: 'user_id'

    # validations
    validates :name, presence: true

end

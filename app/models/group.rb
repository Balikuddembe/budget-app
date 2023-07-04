class Group < ApplicationRecord
  # associations
  has_many :group_expenses, dependent: :destroy
  has_many :expenses, through: :group_expenses
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  # validations
  validates :name, presence: true, length: { in: 1..25 }
  validates :icon, presence: true
end

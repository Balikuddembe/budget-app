class Expense < ApplicationRecord
  # associations
  has_many :group_expenses, dependent: :destroy
  has_many :groups, through: :group_expenses
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  # validations
  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_float: true, greater_than_or_equal_to: 0 }
end

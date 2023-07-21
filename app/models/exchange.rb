class Exchange < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :amount, presence: true
  validates :categories, presence: { message: 'must have at least one category' }
end

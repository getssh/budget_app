class User < ApplicationRecord
  has_many :exchanges, foreign_key: :author_id

  validates :name, presence: true
  validates :icon, presence: true
end

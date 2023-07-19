class User < ApplicationRecord
  has_many :exchanges, foreign_key: :author_id
end

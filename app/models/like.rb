class Like < ApplicationRecord
  belongs_to :user
  belongs_to :social
  has_many :likes
end

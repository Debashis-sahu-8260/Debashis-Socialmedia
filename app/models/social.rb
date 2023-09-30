class Social < ApplicationRecord
    validates :title, presence: true
    validates :content, presence: true
    belongs_to :user
    mount_uploader :image, ImageUploader

    has_many :likes, as: :likeable
    has_many :liking_users, through: :likes, source: :user
    has_many :comments, as: :commentable

end

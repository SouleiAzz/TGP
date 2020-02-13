class Comment < ApplicationRecord
  validates :user, :gossip, :content, presence: true
  belongs_to :user
  belongs_to :gossip
  has_many :likes, as: :content, dependent: :destroy
  has_many :users, through: :likes
  has_many :comment_of_comments
end

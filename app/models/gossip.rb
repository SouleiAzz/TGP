class Gossip < ApplicationRecord
  validates :user, :title, :content, presence: true
  validates :title, length: { in: 3..14 }
  has_many :join_gossip_tags, dependent: :destroy
  has_many :tags, through: :join_gossip_tags
  belongs_to :user
  has_many :likes, as: :content, dependent: :destroy
  has_many :users, through: :likes
  has_many :comments, dependent: :destroy

  def created_at_display
    time = (Time.now - created_at).to_i
    case time 
    when 0...60
      return "a few seconds ago"
    when 60...3600
      return "#{time/60} minute#{time/60 > 1 ? "s" : ""} ago"
    when 3600...86400
      return "#{time/3600} hour#{time/3600 > 1 ? "s" : ""} ago"
    else
      return "#{time/86400} day#{time/86400 > 1 ? "s" : ""} ago"
    end
  end

  def updated_at_display
    time = (Time.now - updated_at).to_i
    if updated_at.to_i == created_at.to_i
      return "never"
    end
    case time
    when 0...60
      return "a few seconds ago"
    when 60...3600
      return "#{time/60} minute#{time/60 > 1 ? "s" : ""} ago"
    when 3600...86400
      return "#{time/3600} hour#{time/3600 > 1 ? "s" : ""} ago"
    else
      return "#{time/86400} day#{time/86400 > 1 ? "s" : ""} ago"
    end
  end
end

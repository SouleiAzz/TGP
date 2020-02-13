class User < ApplicationRecord
  validates :first_name, :last_name, :age, :email, :description, :city, presence: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :likes
  has_many :comment_of_comments
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "JoinPrivateMessageReceiver"
  has_secure_password
  validates :password, length: { minimum: 6 }
end

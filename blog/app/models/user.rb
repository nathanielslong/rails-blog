class User < ApplicationRecord
  has_many :posts

  has_many :comments

  has_many :relationships, foreign_key: :follower_id
  has_many :followed, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: :followed_id, class_name: 'Relationship'
  has_many :followers, through: :reverse_relationships, source: :follower

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  def follow!(user)
    followed << user
  end

  def full_name
    if first_name
      self.first_name + " " + self.last_name
    else
      "Anonymous"
    end
  end

end

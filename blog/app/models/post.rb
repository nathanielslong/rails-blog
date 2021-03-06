class Post < ApplicationRecord
  belongs_to :user

  has_many :comments

  # Checks that title is not longer than 150 char
  validates :title, presence: true, length: {maximum: 150}

  # Checks that a post body exists
  validates :body, presence: true

  # Defines user feed by finding the posts of the users a certain user is following, and orders in descending order (most recent first)
  def self.feed(user)
    where("user_id IN (?) OR user_id = ?", user.followed_ids, user).order("id DESC")
  end

end

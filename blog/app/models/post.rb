class Post < ApplicationRecord
  belongs_to :user

  has_many :comments
  # Checks that title is not longer than 150 char
  validates :title, presence: true, length: {maximum: 150}
  # Checks that a post body exists
  validates :body, presence: true
end

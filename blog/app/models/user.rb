class User < ApplicationRecord
  has_many :posts

  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  def full_name
    if first_name
      self.first_name + " " + self.last_name
    else
      "Anonymous"
    end
  end

end

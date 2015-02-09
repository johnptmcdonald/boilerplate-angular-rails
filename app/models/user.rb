class User < ActiveRecord::Base

  validates :name, :email, presence: true
  validates :email, uniqueness: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}
end

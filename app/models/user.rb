class User < ApplicationRecord
  validates :name, presence: true

  has_many :votes 
  has_many :pizzas, :through => :votes
end

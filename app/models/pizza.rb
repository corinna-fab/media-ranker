class Pizza < ApplicationRecord
  has_many :votes
  has_and_belongs_to_many :temperatures
end

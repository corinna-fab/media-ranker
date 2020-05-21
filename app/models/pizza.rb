class Pizza < ApplicationRecord
  has_many :users, :through => :votes
  has_many :votes
  # has_and_belongs_to_many :temperatures


  def self.pizzas_by_crust(crust_name)
      @crust_list = Pizza.where(crust: crust_name).sort_by{ |pizza| -pizza.votes.count }
      return @crust_list
  end

  def self.top_ten(temperature_name)
    return @crust_list[0..9]
  end
end

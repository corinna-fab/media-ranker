class Pizza < ApplicationRecord
  validates :name, presence: true
  validates :crust, presence: true

  has_many :users, :through => :votes
  has_many :votes

  def self.pizzas_by_crust(crust_name)
      @crust_list = Pizza.where(crust: crust_name).sort_by{ |pizza| -pizza.votes.count }
      
      if @crust_list.empty?
        return nil
      else
        return @crust_list
      end
  end

  def self.top_ten(crust_name)
    return Pizza.pizzas_by_crust(crust_name)[0..9]
  end

  def self.spotlight
    @spotlight_pizza = Pizza.all.sort_by{ |pizza| -pizza.votes.count }
    return @spotlight_pizza[0]
  end
end

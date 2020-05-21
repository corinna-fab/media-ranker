class Pizza < ApplicationRecord
  has_many :users, :through => :votes
  has_many :votes
  has_and_belongs_to_many :temperatures


  def self.pizzas_by_temperature(temperature_name)
    temperature_list = Temperature.find_by(name: temperature_name).pizzas.to_a

    return temperature_list
  end

  def self.top_ten(temperature_name)
    temperature_list = Temperature.find_by(name: temperature_name).pizzas.to_a[0..9]

    return "No pizzas are currently listed" if temperature_list.nil?

    return temperature_list
  end
end

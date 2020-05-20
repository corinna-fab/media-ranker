class Pizza < ApplicationRecord
  has_many :votes
  has_and_belongs_to_many :temperatures


  def self.pizzas_by_temperature(temperature_name)
    temperature_list = Temperature.find_by(name: temperature_name).pizzas

    return temperature_list.inspect
  end

end

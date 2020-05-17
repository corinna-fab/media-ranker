class Temperature < ApplicationRecord
  has_and_belongs_to_many :pizzas

  def self.pizzas_by_temperature(temperature_name)
    temperature_list = Temperature.find_by(name: temperature_name).pizzas

    return temperature_list.order("temperatures.name")
  end

end

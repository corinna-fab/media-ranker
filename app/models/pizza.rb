class Pizza < ApplicationRecord
  has_many :users, :through => :votes
  has_many :votes
  # has_and_belongs_to_many :temperatures


  def self.pizzas_by_crust(crust_name)
      crust_list = Pizza.where(crust: crust_name)
      return crust_list
  end

  def self.top_ten(temperature_name)
    # if ! Temperature.find_by(name: temperature_name).nil? 
    #   temperature_list = Temperature.find_by(name: temperature_name).pizzas.to_a[0..9]
    #   return temperature_list
    # end
    temperature_list = Pizza.where(temperature_ids.include? 1)
    return temperature_list

  end
end

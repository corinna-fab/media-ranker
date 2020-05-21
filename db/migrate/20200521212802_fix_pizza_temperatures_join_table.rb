require_relative "20200515162218_create_pizzas_temperatures_join_table"

class FixPizzaTemperaturesJoinTable < ActiveRecord::Migration[6.0]
  def change
    revert CreatePizzasTemperaturesJoinTable
  end
end

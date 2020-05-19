class CreatePizzasTemperaturesJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :pizzas_temperatures do |t|
      t.belongs_to :pizza, index: true
      t.belongs_to :temperature, index: true
    end
  end
end
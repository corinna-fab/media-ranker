class PizzasController < ApplicationController
  def index
    @pizzas = Pizza.all
  end

  def show
    pizza_id = params[:id]
    @pizza = Pizza.find_by(id: pizza_id)

    if @pizza.nil?
      head :not_found
      return
    end 
  end
end

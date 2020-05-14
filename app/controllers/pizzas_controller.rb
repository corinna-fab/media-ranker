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

  def edit
    pizza_id = params[:id]
    @pizza = Pizza.find_by(id: pizza_id)

    if @pizza.nil?
      head :not_found
      return
    end 
  end

  def update
    @pizza = Pizza.find_by(id: params[:id])
    if @pizza.nil? 
      head :not_found
      return
    elsif @pizza.update(pizza_params)
      redirect_to @pizza
      return
    else
      render :edit, status: :bad_request
    end
  end

  private

  def pizza_params
    return params.require(:pizza).permit(:name, :crust, :sauce, :cheese, :toppings)
  end
  

end

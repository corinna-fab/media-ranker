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

  def new
    @pizza = Pizza.new
  end

  def create
    @pizza = Pizza.new(pizza_params)

    if @pizza.save
      redirect_to @pizza
      return
    else
      render :new, status: :bad_request
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

  def top
    @pizzas = Pizza.all
  end

  private

  def pizza_params
    return params.require(:pizza).permit(:name, :crust, :sauce, :cheese, :toppings, temperature_ids: [])
  end
  

end

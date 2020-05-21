class PizzasController < ApplicationController
  def index
    @pizzas = Pizza.paginate(:page=>params[:page],:per_page=>15).order(updated_at: :desc)
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
      flash[:success] = "Pizza updated successfully"
      redirect_to pizza_path
      return
    else
      flash.now[:error] = "Something happened. Pizza not updated."
      render :edit, status: :bad_request
      return
    end
  end

  def top
    @pizzas = Pizza.all
  end

  def upvote
    @user = User.find_by(id: session[:user_id])
    @pizza = Pizza.find_by(id: params[:id])
    
    if @user.nil?
      flash[:warning] = "You must be logged in to vote."
      redirect_to pizza_path
      return
    end

    if @user.votes.include? @pizza.id
      flash[:warning] = "You have already voted on #{@pizza.name}!"
    else
      new_vote = Vote.new(user_id: @user.id, pizza_id: @pizza.id)

      if new_vote.save
        flash[:success] = "You have successfully voted on #{@pizza.name}!"
      else
        render :new, status: :bad_request
        return
      end
    end

    redirect_to pizza_path
    return
  end

  private

  def pizza_params
    return params.require(:pizza).permit(:name, :crust, :sauce, :cheese, :toppings, temperature_ids: [])
  end
  

end

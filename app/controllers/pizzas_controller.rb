class PizzasController < ApplicationController
  # before_action :require_login, only: [:upvote]

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
    @pizza.vote_count = 0
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

    if @pizza.votes.find_by(user_id: @user.id)
      flash[:warning] = "You have already voted on #{@pizza.name}!"
    else
      new_upvote = Vote.new(user_id: @user.id, pizza_id: @pizza.id)

      if new_upvote.save
        flash[:success] = "You have successfully voted on #{@pizza.name}!"
        if @pizza.vote_count.nil?
          @pizza.vote_count = 1
        else
          @pizza.vote_count += 1
        end
      else
        render :new, status: :bad_request
        return
      end
    end

    redirect_to pizza_path
    return
  end

  def destroy
    @pizza = Pizza.find_by(id: params[:id])

    if @pizza.nil?
      head :not_found
      return
    end

    @pizza.destroy
    flash[:success] = "Successfully deleted #{@pizza.name}" 
    redirect_to root_path
  end
  
  private

  def pizza_params
    return params.require(:pizza).permit(:name, :crust, :sauce, :cheese, :toppings)
  end
  

end

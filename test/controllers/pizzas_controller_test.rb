require "test_helper"

describe PizzasController do
  # it "does a thing" do
  #   value(1+1).must_equal 2
  # end
  before do 
    @pizza = Pizza.create(
      name: 'Butterbeer',
      crust: 'Gluten free',
      sauce: 'Butter',
      cheese: 'Cream Cheese',
      toppings: 'Butterscotch candies'
    )
  end

  it 'must get index' do
    get pizzas_path
    must_respond_with :success
  end

  it 'must get show for valid ids' do
    get pizza_path(@pizza.id)
    must_respond_with :success
  end

  it 'will give an error for a nonexistant pizza' do
    get pizza_path(-1)
    must_respond_with :not_found
  end

  describe "new" do
    # Your tests go here
    it "can get the new_pizza_path" do
      get new_pizza_path

      must_respond_with :success
    end

    it "can get the new_passenger_trip_path" do
      get new_pizza_path(Pizza.first.id)

      must_respond_with :success
    end
  end

  describe "create" do
    # Your tests go here
    it "can create a new pizza" do

      # Arrange
      pizza_hash = {
        pizza: {
          name: 'Oysters on a Half Shell',
          crust: 'Gluten free',
          sauce: 'Cream',
          cheese: 'None',
          toppings: 'Canned Oysters Chives Lemon Capers'
        },
      }
      
      # Act-Assert
      expect {
        post pizzas_path, params: pizza_hash
      }.must_change "Pizza.count", 1
      
      new_pizza = Pizza.find_by(name: pizza_hash[:pizza][:name])
      expect(new_pizza.sauce).must_equal pizza_hash[:pizza][:sauce]

      
      must_respond_with :redirect
      must_redirect_to pizza_path(new_pizza.id)
    end
  end

  describe "edit" do
    before do 
      @pizza = Pizza.create(
        name: 'Mad Max',
        crust: 'Gluten free',
        sauce: 'Spicy Marinara',
        cheese: 'Vegan Mozz',
        toppings: 'Sausage Rat Tails Horseradish'
      )
    end

    # Your tests go here
    it "can get the edit page for an existing pizza" do
      # Your code here
      get edit_pizza_path(Pizza.first.id)
      
      # Assert
      must_respond_with :success
    end
    
    it "will respond with redirect when attempting to edit a nonexistant pizza" do
      # Your code here
      get edit_pizza_path(-1)
      
      # Assert
      must_respond_with :not_found
    end
  end

  describe "update" do
    # Your tests go here
  end

end

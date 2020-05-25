require "test_helper"

describe Pizza do

  before do
    @spicy_pizza = pizzas(:spicytacoparty)
    @cheesy_pizza = pizzas(:macncheese)
  end

  describe "validations" do
    it "can be recalled/is valid" do
      # Assert
      expect(@spicy_pizza.valid?).must_equal true
      expect(@cheesy_pizza.valid?).must_equal true
    end

    it "will not save if the name is nil" do
      # Arrange
      @spicy_pizza.name = nil

      # Assert
      expect(@spicy_pizza.valid?).must_equal false
      expect(@spicy_pizza.errors.messages).must_include :name
      expect(@spicy_pizza.errors.messages[:name]).must_equal ["can't be blank"]
    end

    it "will not save if the crust is nil" do
      # Arrange
      @spicy_pizza.crust = nil

      # Assert
      expect(@spicy_pizza.valid?).must_equal false
      expect(@spicy_pizza.errors.messages).must_include :crust
      expect(@spicy_pizza.errors.messages[:crust]).must_equal ["can't be blank"]
    end
  end

  describe "relationships" do
    before do
      @pizza_one = pizzas(:macncheese)
      @pizza_two = pizzas(:spicytacoparty)
      @user = users(:jane)

      votes(:spicyvote)
      votes(:cheesyvote)
    end

    it "can establish many to many relationship between pizzas and users" do
      expect(@user.votes.length).must_equal 2
      expect(@user.pizzas.length).must_equal 2

      expect(@user.pizzas[0].id).must_equal @pizza_one.id
      expect(@user.pizzas[1].id).must_equal @pizza_two.id
    end

  end

  # Tests for methods you create should go here
  describe "custom methods" do
    describe "filter pizzas by crust" do
      # Your code here
      it "returns nil if no pizzas in category" do
        result = Pizza.pizzas_by_crust('thick')
        expect(result).must_equal nil
      end

      it "returns pizzas by crust type in descending order" do
        expect(Pizza.pizzas_by_crust('thin').length).must_equal 11
        expect(Pizza.pizzas_by_crust('thin')[0].name).must_equal pizzas(:macncheese).name
      end
    end

    describe "return top 10 pizzas based on pizzas by crust method" do
      it "returns no more than 10 pizzas" do
        expect(Pizza.top_ten('thin').length).must_equal 10
      end
      
      it "returns pizzas remain in descending order" do
        expect(Pizza.top_ten('thin')[0].name).must_equal pizzas(:macncheese).name
      end
    end

    describe "spotlight" do
        it "spotlight selects the work with highest vote" do
          result = Pizza.spotlight
  
          expect(result.name).must_equal pizzas(:macncheese).name
        end
  
        it "spotlight returns nil if there are no pizzas" do
          Pizza.all.each do |pizza|
            pizza.votes.each do |vote|
              vote.destroy
            end
            pizza.destroy
          end
  
          result = Pizza.spotlight
          expect(result).must_be_nil
        end
      end
  end
end




require "test_helper"

require "test_helper"

describe User do

  before do
    @user = users(:daria)
  end

  describe "validations" do
    it "can be recalled/is valid" do
      # Assert
      expect(@user.valid?).must_equal true
    end

    it "will not save if the name is nil" do
      # Arrange
      @user.name = nil

      # Assert
      expect(@user.valid?).must_equal false
      expect(@user.errors.messages).must_include :name
      expect(@user.errors.messages[:name]).must_equal ["can't be blank"]
    end

    it "will not create a user if the name already exists" do
      new_user = User.create(name: @user.name)
      result = new_user.valid? 

      expect(result).must_equal false 
      expect(new_user.errors.messages[:name].include?("has already been taken")).must_equal true 
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

    it "can establish multiple votes and indirect relations to pizzas" do
      expect(@user.votes.length).must_equal 2
      expect(@user.pizzas.length).must_equal 2

      expect(@user.pizzas[0].id).must_equal @pizza_one.id
      expect(@user.pizzas[1].id).must_equal @pizza_two.id
    end
  end
end



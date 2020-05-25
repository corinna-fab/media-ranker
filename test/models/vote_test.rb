require "test_helper"

describe Vote do
  before do
    @daria = users(:daria)
    @cheesypizza = pizzas(:macncheese)

    @cheesyvote = votes(:cheesyvote)
    @spicyvote = votes(:spicyvote)
  end

  describe "validations" do
    it "can be recalled/is valid" do
      # Assert
      expect(@cheesyvote.valid?).must_equal true
      expect(@spicyvote.valid?).must_equal true
    end

    it "can be created when pizza_id and user_id are present" do
      new_vote = Vote.new(
        user: @daria,
        pizza: @cheesypizza
      )

      expect(new_vote.valid?).must_equal true
    end

    it "cannot create a new vote when pizza_id is not present" do
      new_vote = Vote.new(user: @daria)

      expect(new_vote.valid?).must_equal false
    end

    it "cannot create a new vote when user_id is not present" do
      new_vote = Vote.new(pizza: @cheesypizza)

      expect(new_vote.valid?).must_equal false
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
  
      it "can establish a pizza and user connection" do
        expect(votes(:spicyvote).user_id).must_equal @user.id
        expect(votes(:spicyvote).pizza_id).must_equal @pizza_two.id
      end
  end

end

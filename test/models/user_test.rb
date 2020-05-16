require "test_helper"

require "test_helper"

describe User do
  let (:new_user) {
    User.new(name: "Kari")
  }
  it "can be instantiated" do
    # Assert
    expect(new_user.valid?).must_equal true
  end

  it "will have the required fields" do
    # Arrange
    new_user.save
    user = User.first
    [:name].each do |field|

      # Assert
      expect(user).must_respond_to field
    end
  end

  describe "relationships" do

  end

  describe "validations" do
    it "must have a name" do
      # Arrange
      new_user.name = nil

      # Assert
      expect(new_user.valid?).must_equal false
      expect(new_user.errors.messages).must_include :name
      expect(new_user.errors.messages[:name]).must_equal ["can't be blank"]
    end
  end

  # Tests for methods you create should go here
  describe "custom methods" do
    describe "request a ride" do
      # Your code here
    end

    describe "complete trip" do
      # Your code here
    end
    # You may have additional methods to test here
  end
end



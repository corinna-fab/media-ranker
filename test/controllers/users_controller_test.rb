require "test_helper"

describe UsersController do
  describe "index" do
    # Your tests go here
    it "should get index" do
      get "/users"
      must_respond_with :success
    end
  end
end

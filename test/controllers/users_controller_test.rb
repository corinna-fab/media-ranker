require "test_helper"

describe UsersController do
  describe "index" do
    # Your tests go here
    it "should get index" do
      get "/users"
      must_respond_with :success
    end
  end

  describe "logging in" do
    it "can get the login path" do
      get '/login'
      must_respond_with :success
    end

    it "can login an existing user" do
      user = User.create(name: 'mrpotatohead')

      expect{
        login(user.name)
      }.wont_change "User.count"
    end

  end

  describe "logging out" do

  end

  describe "current user" do
    
    it "redirects if the user is not logged in" do
      get current_user_path
      must_respond_with :not_found
    end
  end
end

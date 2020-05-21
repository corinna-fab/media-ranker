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

    # it "can log a new user in" do
    # user = nil
    # expect{
    #     user = login()
    # }.must_differ "User.count", 1

    # must_respond_with :redirect

    # expect(user).wont_be_nil
    # expect(session[:user_id]).must_equal user.id

    # end

    it "can login an existing user" do
      user = User.create(name: 'mrpotatohead')

      expect{
        login(user.name)
      }.wont_change "User.count"
      # expect(session[:user_id]).must_equal user.id
    end

  end

  describe "logging out" do
    # it "can logout a user" do
    # login()
    # expect session[:user_id].wont_be_nil

    # post logout_path

    # expect session[:user_id].must_be_nil

    # end
  end

  describe "current user" do
    # it "can return the page if the user is logged in" do
    #   login()
    #   get current_user_path
    #   must_respond_with :success
    # end
    
    it "redirects if the user is not logged in" do
      get current_user_path
      must_respond_with :redirect
      expect(flash[:error]).must_equal "You must be logged in to view this page"
    end
  end
end

require "test_helper"

describe UsersController do
  # it "does a thing" do
  #   value(1+1).must_equal 2
  # end

  it "can get to the login form" do
    get login_path

    must_respond_with :success
  end

  describe "logging in" do
    it "can login a new user" do
      user = nil
    
      expect {
        user = login()
      }.must_differ "User.count", 1

      must_respond_with :redirect

      expect(user).wont_be_nil
      expect(session[:user_id]).must_equal user.id
      expect(user.name).must_equal "Wednesday Addams"
    end

    it "can login an existing user" do
      user = User.create(name: 'tellytubby')

      expect{
        login(user.name)
      }.wont_change "User.count"

      expect(session[:user_id]).must_equal user.id
    end
  end
end

require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "Successful login" do
  	user = User.login({ :username => Users(:ethan).username, :password => Users(:ethan).password })
    assert !user.nil?, "Login Failed"
  end

  test "Unsuccessful login" do
  	user = User.login({ :username => "George", :password => "Whatev"})
  	assert user.nil?, "Login succeeded"
end

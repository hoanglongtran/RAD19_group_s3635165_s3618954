require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
 
  def setup
	@user = User.create(name: "asdf", email: "gfd.asd@rmit.edu.au", password: "Foob@ra4", password_confirmation: "Foob@ra4")
  end  


  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email:    @user.email,
                                          password: 'Foob@ra4' } }
    assert is_logged_in?
    assert_redirected_to :courses
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path,      count: 0
    assert_select "a[href=?]", user_path(@user), count: 0
  end
  end

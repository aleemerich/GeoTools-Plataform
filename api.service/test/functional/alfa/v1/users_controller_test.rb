require 'test_helper'

class Alfa::V1::UsersControllerTest < ActionController::TestCase
  setup do
    @alfa_v1_user = alfa_v1_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alfa_v1_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alfa_v1_user" do
    assert_difference('Alfa::V1::User.count') do
      post :create, :alfa_v1_user => {  }
    end

    assert_redirected_to alfa_v1_user_path(assigns(:alfa_v1_user))
  end

  test "should show alfa_v1_user" do
    get :show, :id => @alfa_v1_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @alfa_v1_user
    assert_response :success
  end

  test "should update alfa_v1_user" do
    put :update, :id => @alfa_v1_user, :alfa_v1_user => {  }
    assert_redirected_to alfa_v1_user_path(assigns(:alfa_v1_user))
  end

  test "should destroy alfa_v1_user" do
    assert_difference('Alfa::V1::User.count', -1) do
      delete :destroy, :id => @alfa_v1_user
    end

    assert_redirected_to alfa_v1_users_path
  end
end

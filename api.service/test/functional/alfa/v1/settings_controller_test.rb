require 'test_helper'

class Alfa::V1::SettingsControllerTest < ActionController::TestCase
  setup do
    @alfa_v1_setting = alfa_v1_settings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alfa_v1_settings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alfa_v1_setting" do
    assert_difference('Alfa::V1::Setting.count') do
      post :create, :alfa_v1_setting => {  }
    end

    assert_redirected_to alfa_v1_setting_path(assigns(:alfa_v1_setting))
  end

  test "should show alfa_v1_setting" do
    get :show, :id => @alfa_v1_setting
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @alfa_v1_setting
    assert_response :success
  end

  test "should update alfa_v1_setting" do
    put :update, :id => @alfa_v1_setting, :alfa_v1_setting => {  }
    assert_redirected_to alfa_v1_setting_path(assigns(:alfa_v1_setting))
  end

  test "should destroy alfa_v1_setting" do
    assert_difference('Alfa::V1::Setting.count', -1) do
      delete :destroy, :id => @alfa_v1_setting
    end

    assert_redirected_to alfa_v1_settings_path
  end
end

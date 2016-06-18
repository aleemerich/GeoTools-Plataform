require 'test_helper'

class Alfa::V1::CompaniesControllerTest < ActionController::TestCase
  setup do
    @alfa_v1_company = alfa_v1_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alfa_v1_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create alfa_v1_company" do
    assert_difference('Alfa::V1::Company.count') do
      post :create, :alfa_v1_company => {  }
    end

    assert_redirected_to alfa_v1_company_path(assigns(:alfa_v1_company))
  end

  test "should show alfa_v1_company" do
    get :show, :id => @alfa_v1_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @alfa_v1_company
    assert_response :success
  end

  test "should update alfa_v1_company" do
    put :update, :id => @alfa_v1_company, :alfa_v1_company => {  }
    assert_redirected_to alfa_v1_company_path(assigns(:alfa_v1_company))
  end

  test "should destroy alfa_v1_company" do
    assert_difference('Alfa::V1::Company.count', -1) do
      delete :destroy, :id => @alfa_v1_company
    end

    assert_redirected_to alfa_v1_companies_path
  end
end

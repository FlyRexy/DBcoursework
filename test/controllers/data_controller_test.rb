require "test_helper"

class DataControllerTest < ActionDispatch::IntegrationTest
  test "should get shops" do
    get data_shops_url
    assert_response :success
  end

  test "should get clients" do
    get data_clients_url
    assert_response :success
  end

  test "should get employees" do
    get data_employees_url
    assert_response :success
  end

  test "should get purchases" do
    get data_purchases_url
    assert_response :success
  end

  test "should get cakes" do
    get data_cakes_url
    assert_response :success
  end

  test "should get purchase_details" do
    get data_purchase_details_url
    assert_response :success
  end

  test "should get reviews" do
    get data_reviews_url
    assert_response :success
  end
end

require "test_helper"

class ShowControllerTest < ActionDispatch::IntegrationTest
  test "should get shops" do
    get show_shops_url
    assert_response :success
  end

  test "should get clients" do
    get show_clients_url
    assert_response :success
  end

  test "should get employees" do
    get show_employees_url
    assert_response :success
  end

  test "should get purchases" do
    get show_purchases_url
    assert_response :success
  end

  test "should get cakes" do
    get show_cakes_url
    assert_response :success
  end

  test "should get purchase_details" do
    get show_purchase_details_url
    assert_response :success
  end

  test "should get reviews" do
    get show_reviews_url
    assert_response :success
  end
end

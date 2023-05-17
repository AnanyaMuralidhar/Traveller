require "test_helper"

class TrippackagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trippackage = trippackages(:one)
  end

  test "should get index" do
    get trippackages_url
    assert_response :success
  end

  test "should get new" do
    get new_trippackage_url
    assert_response :success
  end

  test "should create trippackage" do
    assert_difference("Trippackage.count") do
      post trippackages_url, params: { trippackage: { arrival: @trippackage.arrival, departure: @trippackage.departure, description: @trippackage.description, destination: @trippackage.destination, package_name: @trippackage.package_name } }
    end

    assert_redirected_to trippackage_url(Trippackage.last)
  end

  test "should show trippackage" do
    get trippackage_url(@trippackage)
    assert_response :success
  end

  test "should get edit" do
    get edit_trippackage_url(@trippackage)
    assert_response :success
  end

  test "should update trippackage" do
    patch trippackage_url(@trippackage), params: { trippackage: { arrival: @trippackage.arrival, departure: @trippackage.departure, description: @trippackage.description, destination: @trippackage.destination, package_name: @trippackage.package_name } }
    assert_redirected_to trippackage_url(@trippackage)
  end

  test "should destroy trippackage" do
    assert_difference("Trippackage.count", -1) do
      delete trippackage_url(@trippackage)
    end

    assert_redirected_to trippackages_url
  end
end

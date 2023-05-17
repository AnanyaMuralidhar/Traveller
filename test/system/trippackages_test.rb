require "application_system_test_case"

class TrippackagesTest < ApplicationSystemTestCase
  setup do
    @trippackage = trippackages(:one)
  end

  test "visiting the index" do
    visit trippackages_url
    assert_selector "h1", text: "Trippackages"
  end

  test "should create trippackage" do
    visit trippackages_url
    click_on "New trippackage"

    fill_in "Arrival", with: @trippackage.arrival
    fill_in "Departure", with: @trippackage.departure
    fill_in "Description", with: @trippackage.description
    fill_in "Destination", with: @trippackage.destination
    fill_in "Package name", with: @trippackage.package_name
    click_on "Create Trippackage"

    assert_text "Trippackage was successfully created"
    click_on "Back"
  end

  test "should update Trippackage" do
    visit trippackage_url(@trippackage)
    click_on "Edit this trippackage", match: :first

    fill_in "Arrival", with: @trippackage.arrival
    fill_in "Departure", with: @trippackage.departure
    fill_in "Description", with: @trippackage.description
    fill_in "Destination", with: @trippackage.destination
    fill_in "Package name", with: @trippackage.package_name
    click_on "Update Trippackage"

    assert_text "Trippackage was successfully updated"
    click_on "Back"
  end

  test "should destroy Trippackage" do
    visit trippackage_url(@trippackage)
    click_on "Destroy this trippackage", match: :first

    assert_text "Trippackage was successfully destroyed"
  end
end

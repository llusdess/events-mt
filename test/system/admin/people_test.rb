# frozen_string_literal: true
require "application_system_test_case"

class Admin::PeopleTest < ApplicationSystemTestCase
  setup do
    @person = create(:person)
    @user = create(:user, :admin_user)
    create(:organization_user, user: @user, organization: create(:organization))
  end

  test "visiting the index" do
    visit admin_people_url(as: @user)
    assert_selector "h1", text: "People"
  end

  test "creating a Person" do
    visit admin_people_url(as: @user)
    click_link "New Person"

    fill_in "Cell", with: @person.cell
    check("Company") if @person.company
    fill_in "Company name", with: @person.company_name
    fill_in "Country code", with: @person.country_code
    fill_in "Degrees", with: @person.degrees
    fill_in "Email", with: @person.email
    fill_in "Fax", with: @person.fax
    fill_in "Fax extension", with: @person.fax_extension
    fill_in "First name", with: @person.first_name
    fill_in "Last name", with: @person.last_name
    fill_in "Phone", with: @person.phone
    fill_in "Phone extension", with: @person.phone_extension
    fill_in "Prefered name", with: @person.prefered_name
    fill_in "Prefix", with: @person.prefix
    fill_in "Suffix", with: @person.suffix
    fill_in "Tags", with: @person.tags
    fill_in "Title", with: @person.title
    click_on "Create Person"

    assert_text "Person was successfully created"
    click_on "Back"
  end

  test "updating a Person" do
    visit admin_people_url(as: @user)
    click_on "Edit", match: :first

    check("Company")
    fill_in "Company name", with: "Torp - Conn"
    click_on "Update Person"

    assert_text "Person was successfully updated"
    click_on "Back"
  end

  test "destroying a Person" do
    visit admin_people_url(as: @user)
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Person was successfully destroyed"
  end
end

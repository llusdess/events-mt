# frozen_string_literal: true
require "test_helper"

class Admin::PeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @person = create(:person)
    @user = create(:user, :admin_user)
    create(:organization_user, user: @user, organization: create(:organization))
  end

  test "should get index" do
    get admin_people_url(as: @user)
    assert_response :success
  end

  test "should get new" do
    get new_admin_person_url(as: @user)
    assert_response :success
  end

  test "should create person" do
    assert_difference("Person.count") do
      post admin_people_url(as: @user), params: { person: attributes_for(:person) }
    end
  end

  test "should redirect to the new persson" do
    post admin_people_url(as: @user), params: { person: attributes_for(:person, email: "stewart.prohaska95@yahoo.com") }
    person = Person.find_by(email: "stewart.prohaska95@yahoo.com")  
    assert_redirected_to admin_person_url(person)
  end

  test "should show person" do
    get admin_person_url(@person, as: @user)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_person_url(@person, as: @user)
    assert_response :success
  end

  test "should update person" do
    patch admin_person_url(@person, as: @user), params: {
      person: {
        cell:            @person.cell,
        company:         @person.company,
        company_name:    @person.company_name,
        country_code:    @person.country_code,
        degrees:         @person.degrees,
        email:           @person.email,
        fax:             @person.fax,
        fax_extension:   @person.fax_extension,
        first_name:      @person.first_name,
        last_name:       @person.last_name,
        phone:           @person.phone,
        phone_extension: @person.phone_extension,
        prefered_name:   @person.prefered_name,
        prefix:          @person.prefix,
        suffix:          @person.suffix,
        tags:            @person.tags,
        title:           @person.title
      }
    }
    assert_redirected_to admin_person_url(@person)
  end

  test "should destroy person" do
    assert_difference("Person.count", -1) do
      delete admin_person_url(@person, as: @user)
    end

    assert_redirected_to admin_people_url
  end
end

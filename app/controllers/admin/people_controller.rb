# frozen_string_literal: true
module Admin
  class PeopleController < Admin::ApplicationController
    before_action :set_person, only: [:show, :edit, :update, :destroy]

    add_breadcrumb "People", :admin_people_path

    def index
      authorize!
      @people = Person.all
    end

    def show
      authorize!
      add_breadcrumb("Details", :admin_users_path)
    end

    def new
      authorize!
      @person = Person.new
      add_breadcrumb("New", :admin_users_path)
    end

    def edit
      authorize!
      add_breadcrumb("Edit", :admin_users_path)
    end

    def create
      authorize!
      @person = Person.new(person_params)
      if @person.save
        redirect_to admin_person_url(@person), notice: "Person was successfully created."
      else
        render :new
      end
    end

    def update
      authorize!
      if @person.update(person_params)
        redirect_to admin_person_url(@person), notice: "Person was successfully updated."
      else
        render :edit
      end
    end

    def destroy
      authorize!
      @person.destroy
      redirect_to admin_people_url, notice: "Person was successfully destroyed."
    end

    private

    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(
        :last_name,
        :first_name,
        :prefered_name,
        :prefix, :suffix,
        :degrees,
        :tags,
        :email,
        :company,
        :company_name,
        :title,
        :country_code,
        :cell,
        :phone,
        :phone_extension,
        :fax,
        :fax_extension
      )
    end

    def set_active_navigation
      navigation["Admin::Main"].activate(:people)
    end
  end
end

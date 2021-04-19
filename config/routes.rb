# frozen_string_literal: true
Rails.application.routes.draw do
  scope module: "public" do
    root "frontpage#index"
  end

  resource :session, controller: "sessions", only: [:create]

  namespace :admin do
    root "organizations#index"
    constraints Clearance::Constraints::SignedIn.new do
      get :dashboard, to: "dashboard#show"
      resources :organizations, only: [:index, :show]
      resources :people
      resources :users
    end
  end
end

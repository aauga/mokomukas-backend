# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/api' do
    resources :sessions, only: [:create]
  end
end

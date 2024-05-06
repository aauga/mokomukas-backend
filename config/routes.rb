# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/api' do
    resources :sessions, only: %i[index create]
    delete '/sessions', to: 'sessions#destroy'
    resources :users, only: [:create]
  end
end

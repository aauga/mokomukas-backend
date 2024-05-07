# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/api' do
    resources :users, only: [:create]
    resources :lessons, only: [:index]
    resources :tasks, only: [:show]

    resources :user_lessons, only: %i[index create]

    resources :sessions, only: %i[index create]
    delete '/sessions', to: 'sessions#destroy'
  end
end

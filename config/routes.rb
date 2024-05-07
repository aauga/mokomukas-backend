# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/api' do
    resources :users, only: [:create]
    resources :lessons, only: [:index]
    resources :tasks, only: [:show]

    resources :sessions, only: %i[index create]
    delete '/sessions', to: 'sessions#destroy'

    get '/user_lessons/:lesson_id', to: 'user_lessons#show'
    post '/user_lessons/:lesson_id', to: 'user_lessons#create'
  end
end

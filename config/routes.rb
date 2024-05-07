# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/api' do
    resources :users, only: [:create]
    resources :lessons, only: [:index]
    resources :tasks, only: [:show]

    resources :user_lessons, only: %i[index create]
    put '/user_tasks/:task_id/finish', to: 'user_tasks#finish'
    put '/user_task_elements/:task_element_id/click', to: 'user_task_elements#click'

    resources :sessions, only: %i[index create]
    delete '/sessions', to: 'sessions#destroy'
  end
end

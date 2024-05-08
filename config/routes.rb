# frozen_string_literal: true

Rails.application.routes.draw do
  scope '/api' do
    resources :users, only: [:create]
    resources :tasks, only: [:show] do
      resources :task_elements, only: [:index]
    end

    get '/lessons/available', to: 'lessons#available'
    resources :user_lessons, only: %i[index create]

    resources :user_tasks, only: [:index]
    put '/user_tasks/:task_id/finish', to: 'user_tasks#finish'

    resources :user_task_elements, only: [:index]
    put '/user_task_elements/:task_element_id/click', to: 'user_task_elements#click'

    resources :sessions, only: %i[index create]
    delete '/sessions', to: 'sessions#destroy'
  end
end

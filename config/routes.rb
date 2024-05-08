# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api do
    resources :users, only: %i[create] do
      post :logout

      collection do
        get :auth
        post :login
      end
    end

    resources :lessons do
      collection do
        get :available
      end

      scope module: :lessons do
        resources :users, only: %i[index create]
      end
    end

    resources :tasks, only: [:show] do
      scope module: :tasks do
        resources :elements, only: [:index]
      end
    end

    resources :user_lessons do
      scope module: :user_lessons do
        resources :tasks, only: [:index]
      end
    end

    resources :user_tasks, only: [:index] do
      put :finish

      scope module: :user_tasks do
        resources :elements, only: [:index]
      end
    end

    resources :user_task_elements do
      put :click
    end
  end
end

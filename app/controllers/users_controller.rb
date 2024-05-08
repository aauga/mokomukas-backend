# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate, only: %i[auth logout]
  before_action :forbid_authenticated, only: %i[create login]

  def auth
    render json: current_user
  end

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id

    render json: user
  end

  def login
    user = User.find_by!(username: user_params[:username])

    if user.authenticate(user_params[:password])
      session[:user_id] = user.id
      render json: user
    else
      render status: :unauthorized
    end
  end

  def logout
    session[:user_id] = nil
    render status: :ok
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

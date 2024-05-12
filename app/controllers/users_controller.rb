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

  def leaderboard
    render json: Users::Streaks::FetchLeaderboard.run(current_user)
  end

  def buy_resources
    render status: :not_found unless (current_user = User.find(params[:user_id]))

    result = Users::Shops::BuyResources.run(current_user, resources_params)

    render json: result
  end

  private

  def resources_params
    params.permit(:resource_type)
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

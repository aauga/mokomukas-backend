# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :forbid_authenticated, only: :create

  def create
    user = User.create!(user_params)
    session[:user_id] = user.id

    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :authenticate, only: %i[index destroy]

  def index
    render json: current_user
  end

  def create
    user = Sessions::AuthenticateUser.run(session_params)

    if user
      session[:user_id] = user.id
    else
      render status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render status: :ok
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end

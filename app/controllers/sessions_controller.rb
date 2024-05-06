# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = Sessions::AuthenticateUser.run(session_params)

    if user
      session[:user_id] = user.id
    else
      render status: :unauthorized
    end
  end

  private

  def session_params
    params.require(:session).permit(:username, :password)
  end
end

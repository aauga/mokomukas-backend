# frozen_string_literal: true

class ApplicationController < ActionController::API
  attr_reader :user

  def authenticate
    @user ||= User.find(session[:user_id])
  rescue StandardError
    render status: :unauthorized
  end

  def forbid_authenticated
    return unless session[:user_id]

    render status: :forbidden
  end
end

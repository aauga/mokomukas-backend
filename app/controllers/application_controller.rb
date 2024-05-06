# frozen_string_literal: true

class ApplicationController < ActionController::API
  attr_reader :user

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :bad_request

  def authenticate
    @user ||= User.find(session[:user_id])
  rescue StandardError
    render status: :unauthorized
  end

  def forbid_authenticated
    return unless session[:user_id]

    render status: :forbidden
  end

  def internal_server_error(error)
    raise error unless Rails.env.production?

    error_response('System Error', :internal_server_error)
  end

  def not_found
    error_response('Not Found', :not_found)
  end

  def bad_request(error)
    error_response(error.message, :bad_request)
  end

  def error_response(message, status)
    render json: { error_message: message }, status:
  end
end

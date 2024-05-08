# frozen_string_literal: true

class UserHintsController < ApplicationController
  before_action :authenticate

  def buy
    render status: :not_found unless user_hint.belongs_to?(current_user)
    render status: :bad_request unless user_hint.updatable?

    user_hint.bought!

    render json: user_hint
  end

  private

  def user_hint
    @user_hint ||= UserHint.find(params[:user_hint_id])
  end
end

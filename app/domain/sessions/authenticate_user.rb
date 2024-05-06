# frozen_string_literal: true

class Sessions::AuthenticateUser
  include Interactor::Initializer

  initialize_with :params

  def run
    user.authenticate(params[:password])
  end

  private

  def user
    User.find_by!(username: params[:username])
  end
end

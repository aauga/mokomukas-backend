# frozen_string_literal: true

class Users::Streaks::FetchLeaderboard
  include Interactor::Initializer

  initialize_with :user

  def run
    return { leaderboard: } unless user

    { personal_standing:, streak:, leaderboard: }
  end

  private

  def personal_standing
    ordered_users.pluck(:id).index(user.id) + 1
  end

  def streak
    user.day_streak
  end

  def leaderboard
    leaderboard = ordered_users.map do |user|
      UserSerializer.new(user).attributes
    end
    leaderboard.first(5)
  end

  def ordered_users
    @ordered_users ||= User.all.order(day_streak: :desc)
  end
end

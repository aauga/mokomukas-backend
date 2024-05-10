# frozen_string_literal: true

class Users::RegenerateHealthJob
  include Sidekiq::Job

  def perform
    User.all.find_each do |user|
      next unless user.last_health_change_at <= 10.minutes.ago

      user.add_health
    end
  end
end

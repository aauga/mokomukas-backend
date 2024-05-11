# frozen_string_literal: true

class Lessons::CreateDailyJob
  include Sidekiq::Job

  def perform
    Lessons::CreateDaily.run
  end
end

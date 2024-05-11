# frozen_string_literal: true

class Lessons::CreateDailyJob
  include Sidekiq::Job

  def perform
    Lessons::Daily::Create.run
  end
end

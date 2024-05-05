# frozen_string_literal: true

class Lessons::FetchContent
  include Interactor::Initializer

  initialize_with :lesson

  def run
    fetch_content
  end

  private

  def fetch_content

  end
end

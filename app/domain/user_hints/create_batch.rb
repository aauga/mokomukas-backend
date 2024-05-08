# frozen_string_literal: true

module UserHints::CreateBatch
  module_function

  def run(user_task)
    hints = user_task.task.hints
    hints.each { |hint| UserHint.create!(user_task:, hint:) }
  end
end

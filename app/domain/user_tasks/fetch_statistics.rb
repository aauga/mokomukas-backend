# frozen_string_literal: true

class UserTasks::FetchStatistics
  include Interactor::Initializer

  initialize_with :user_task

  delegate :user_lesson, :user_task_elements, to: :user_task

  def run
    {
      current_task:,
      total_tasks:,
      start_date:,
      total_elements:,
      correctly_clicked_elements:,
      earned_money:,
      earned_experience_points:
    }
  end

  private

  def current_task
    user_lesson.user_tasks.find_index(user_task) + 1
  end

  def total_tasks
    user_lesson.user_tasks.count
  end

  def start_date
    user_task.created_at
  end

  def total_elements
    user_task_elements.count
  end

  def correctly_clicked_elements
    user_task_elements.correctly_clicked.count
  end

  def earned_money
    correctly_clicked_elements * UserAwards::MONEY
  end

  def earned_experience_points
    correctly_clicked_elements * UserAwards::EXPERIENCE_POINTS
  end
end

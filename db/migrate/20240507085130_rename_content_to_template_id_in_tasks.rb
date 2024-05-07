# frozen_string_literal: true

class RenameContentToTemplateIdInTasks < ActiveRecord::Migration[7.1]
  def change
    rename_column :tasks, :content, :template_id
  end
end

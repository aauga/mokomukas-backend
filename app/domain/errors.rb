# frozen_string_literal: true

module Errors
  class ForbiddenAccess < StandardError; end
  class TaskAlreadyFinished < StandardError; end
end

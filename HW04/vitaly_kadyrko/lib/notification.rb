# frozen_string_literal: true

class Notification
  attr_reader :homework, :text

  def initialize(homework:, text:)
    @homework = homework
    @text = text
  end
end

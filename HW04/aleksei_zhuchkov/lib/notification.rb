# frozen_string_literal: true

class Notification
  attr_reader :title, :description

  def initialize(title = 'None', description = 'None')
    @title = title
    @description = description
  end

  def get_notifications(notifications)
    return 'None notification' if notifications.empty?

    result = []
    notifications.each { |el| result << [el.title, el.description] }
    result
  end
end

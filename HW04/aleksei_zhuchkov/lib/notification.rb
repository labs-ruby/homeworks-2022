# frozen_string_literal: true

class Notification
  attr_reader :title, :description

  def initialize(title = 'None', description = 'None')
    @title = title
    @description = description
  end

  def print_notifications(notifications)
    return 'None notification' if notifications.empty?

    notifications.each(&:print_note)
    puts '====================='
  end

  def print_note
    puts "Title: #{title}, discription: #{description}"
    [title, description]
  end
end

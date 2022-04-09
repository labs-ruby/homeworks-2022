# frozen_string_literal: true

class Person
  attr_accessor :name, :surname

  def initialize(name:, surname:)
    @name = name
    @surname = surname

    @notifications = []
  end

  def fullname
    "#{@name} #{@surname}"
  end

  def notifications
    if number_of_unread_notifications.zero?
      puts '> There are no new notifications.'
      return
    end

    unread_notifications.each do |notification|
      puts "> New notification for '#{fullname}' \
      (#{self.class.name}): #{notification.title} \
      (#{notification.description})"
    end
  end

  def mark_as_read!
    unread_notifications.map!(&:mark_as_read)
  end

  protected

  def add_notification(notification)
    @notifications << notification
  end

  private

  def unread_notifications
    @notifications.filter(&:unread?)
  end

  def number_of_unread_notifications
    unread_notifications.size
  end
end

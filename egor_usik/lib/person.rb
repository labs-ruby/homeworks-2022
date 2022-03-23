class Person
  attr_reader :notifications
  attr_accessor :name, :surname

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @surname = attributes.fetch(:surname)

    @notifications = []

    puts "> #{self.class} #{@name} #{@surname} was created."
  end

  def fullname
    "#{@name} #{surname}"
  end

  def notifications
    return 'There are no new notifications yet' if number_of_unread_notifications.zero?

    unread_notifications
  end

  def notify(message)
    puts message
  end

  def add_notification(notification)
    @notifications << notification
  end

  def mark_as_read!
    @notifications.map { |notification| notification.mark_as_read }
  end

  private

  def number_of_notifications
    @notifications.size
  end

  def unread_notifications
    @notifications.select { |notification| notification.unread? }
  end

  def number_of_unread_notifications
    unread_notifications.size
  end
end
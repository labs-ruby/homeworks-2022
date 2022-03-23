# frozen_string_literal: true

class Presenter
  def self.print_notifications(notifications)
    notifications.each do |notification|
      puts "New notification:\n #{notification.title}, #{notification.description}"
    end
  end

  def self.print_homeworks(homeworks)
    homeworks.each { |homework| puts "Homework #{homework.title}: #{homework.description}" }
  end
end

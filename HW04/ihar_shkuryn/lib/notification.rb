# frozen_string_literal: true

class Notification
  attr_accessor :message

  def initialize(message)
    @message = message
  end

  def add_notification_to_file(filename, notification)
    File.open(filename, 'w') do |f|
      f.write("#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} #{notification}\n")
      f.close
    end
  end

  def read_notification_from_file(filename)
    puts File.read(filename)
  end
end

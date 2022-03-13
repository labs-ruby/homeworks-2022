module Notification
  def add_notification_to_file_for_student(filename, notification)
    notification_color(filename, notification, 'cyan')
  end

  def add_notification_to_file_for_mentor(filename, notification)
    notification_color(filename, notification, 'red')
  end

  def add_new_file(filename, notification_or_answer)
    File.open(filename, 'w') do |f|
      f.write("#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} " + notification_or_answer + "\n")
      f.close
    end
  end

  def read_notification_file(filename)
    puts File.read(filename)
  end

  private

  def notification_color(filename, notification, color)
    File.open(filename, 'a') do |f|
      f.write(("#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} " + notification + "\n").send(color))
      f.close
    end
  end
end

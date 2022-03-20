# frozen_string_literal: true

require_relative 'user'
class Student < User
  def homeworks
    dir = read_dir(folder(self)).to_a
    dir.reject! { |name| name.include?('notification') || !name.include?('.txt') }.each do |file_name|
      show(folder(self), file_name)
    end
  end

  def to_work!(homework)
    homework.add_student_observer(self)
    homework.to_work!
  end

  def add_answer!(homework, answer)
    homework.add_answer!(answer)
  end

  def to_check!(homework)
    homework.to_check!
  end

  def update(homework)
    notification_message = "#{homework.title} - #{homework.state}"
    add_notification(self, notification_message)
  end
end

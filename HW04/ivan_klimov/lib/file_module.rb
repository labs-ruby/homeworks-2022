# frozen_string_literal: true

module LogSystem
  def create_log_file(person:)
    File.open(student_notifications(person), 'w') do |f|
      f.write("#{person.name}, this is your notification file.\n")
      f.close
    end
  end

  def create_homeworks_file(student)
    File.open(student_homeworks(student), 'w') do |f|
      f.write("#{name}, this is your file for homeworks.\n")
      f.close
    end
  end

  def input_hw(filename, notification)
    File.open(filename, 'a') do |f|
      f.write("#{Time.new.strftime('%d-%m-%Y %H:%M:%S ')} #{notification}\n")
      f.close
    end
  end

  def student_homeworks(student)
    "#{student.name}_#{student.surname}_homeworks.txt"
  end

  def notification_for_student(student, text)
    File.open(student_notifications(student), 'a') do |f|
      f.write("Notification : #{text}\n")
      f.close
    end
  end

  def student_notifications(student)
    "#{student.name}_#{student.surname}_notifications.txt"
  end

  def notification_for_mentor(mentor, text)
    File.open(mentor_notifications(mentor), 'a') do |f|
      f.write("Notification : #{text}\n")
      f.close
    end
  end

  def mentor_notifications(mentor)
    "#{mentor.name}_#{mentor.surname}_notifications.txt"
  end

  def read_file_hw(student)
    puts File.read(student_homeworks(student))
  end

  def read_file_nf(student)
    puts File.read(student_notifications(student))
  end

  def create_answer_file(student, homework, ans)
    File.open(student_ans(student), 'w') do |f|
      f.write("Answer for #{homework.title} is '#{ans}'\n")
      f.close
    end
  end

  def student_ans(student)
    "#{student.name}_#{student.surname}_answer.txt"
  end
end

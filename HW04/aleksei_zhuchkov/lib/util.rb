# frozen_string_literal: true

def print_notification_for_students_and_mentor(name, surname, array_notifications, type_person)
  return 'None notification' if array_notifications.empty?

  if type_person == "mentor"
    puts "Notification for #{type_person} (#{name} #{surname})"
    storage_students.each do |student|
      puts "Students: #{student.name} #{student.surname}"
      student.storage_notification_for_mentor.each(&:print_notification)
      puts "\n"
    end
    puts '-----------------------------'
  else  
    puts "Notification for #{type_person} (#{name} #{surname}):"
    storage_notification_for_student.each(&:print_notification)
    puts '-----------------------------'
  end
end
# frozen_string_literal: true

require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

student = Student.new(name: 'Andrei', surname: 'Godes')
mentor = Mentor.new(name: 'Alexander', surname: 'Shagov')

# mentor add new homework
homework = mentor.add_homework(title: 'HW04',
                               description: 'interaction between students and mentors',
                               student: student)

# student see notification about new homework
puts "Student noitifications: (#{student.notifications.count}) \n"
puts student.notifications
# student mark as read all notifications
student.mark_as_read!
# mentor subscribe to student
mentor.subscribe_to!(student)
# student take to work homework
puts "Student homeworks: (#{student.homeworks.count})"
puts student.homeworks

student.to_work!(homework)
puts "Student homeworks: (#{student.homeworks.count})"
puts student.homeworks
# mentor see notification about homework to work
puts "Mentor noitifications: (#{mentor.notifications.count}) \n"
puts mentor.notifications
# mentor mark as read all notifications
mentor.mark_as_read!
puts "Mentor noitifications: (#{mentor.notifications.count}) \n"
puts mentor.notifications
# student can see homeworks
puts student.homeworks
# student add answer to homework
student.add_answer!(homework, 'new students answer')
# student sent to check homework
student.to_check!(homework)
# mentor see notification about homework to check
puts "Mentor noitifications: (#{mentor.notifications.count}) \n"
puts mentor.notifications
# mentor reject homework
mentor.reject_to_work!(homework)
# student see notification about homework was reject
puts "Student noitifications: (#{student.notifications.count}) \n"
puts student.notifications
# ---
student.add_answer!(homework, 'new students answer_after reject')
student.to_check!(homework)
# ---
# mentor accept homework
mentor.accept!(homework)
# student see notification about homework was accept
puts "Student noitifications: (#{student.notifications.count}) \n"
puts student.notifications

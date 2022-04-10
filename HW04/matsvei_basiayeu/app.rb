# frozen_string_literal: true

require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

student = Student.new(name: 'Matsvei', surname: 'Basiayeu')
mentor = Mentor.new(name: 'Boris', surname: 'Tsarikov')
homework = mentor.add_homework(title: 'HW04', description: 'implementation classes structure', student: student)

# student see notification about new homework
puts "Student notifications: #{student.notifications.count} notifications #{student.notifications}"

# student mark as read all notifications
student.mark_as_read!
puts "Student notifications after reading: #{student.notifications.count} notifications #{student.notifications}"

# mentor subscribe to student
mentor.subscribe_to!(student)
puts "Mentor subscriptions #{mentor.subscriptions}"

# student take to work homework
puts "Student homeworks: #{student.homeworks.count} homeworks #{student.homeworks}"

student.to_work!(homework)
puts "Student homeworks: #{student.homeworks.count} homeworks #{student.homeworks}"

# mentor see notification about homework to work
puts "Mentor notifications: #{mentor.notifications.count} notifications #{mentor.notifications}"

# mentor mark as read all notifications
mentor.mark_as_read!
puts "Mentor notifications after reading: #{mentor.notifications.count} notification #{mentor.notifications}"

# student can see homeworks
puts "Student notifications: #{student.notifications.count} notifications #{student.notifications}"

# student add answer to homework
student.add_answer!(homework, 'new students answer')

# student sent to check homework
student.send_to_check!(homework)

# mentor see notification about homework to check
puts "Mentor notifications: #{mentor.notifications.count} notifications #{mentor.notifications}"

# mentor reject homework
mentor.reject_to_work!(homework)

# student see notification about homework was reject
puts "Student notifications: #{student.notifications.count} notifications #{student.notifications}"

# ---
student.add_answer!(homework, 'I add new answer')
student.send_to_check!(homework)
# ---

# mentor accept homework
mentor.accept!(homework)

# student see notification about homework was accept
puts "Student noitifications: #{student.notifications.count} notifications #{student.notifications}"
puts "Student noitifications: #{mentor.notifications.count} notifications #{mentor.notifications}"

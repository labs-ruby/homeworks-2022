# frozen_string_literal: true

# Your application should describe the interaction between students and mentors.
# See example of how it should look like.
# When you implement the classes structure, create an app.rb file
# where you will show the interactions between objects like in the example.

require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

student = Student.new(name: 'John', surname: 'Doe')
mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')

# mentor add new homework
homework = mentor.add_homework(title: 'HW03',
                               description: 'description homework',
                               student: student)

# student see notification about new homework
student.notifications_list
# student mark as read all notifications
student.mark_as_read!
# mentor subscribe to student
mentor.subscribe_to!(student)
# student take to work homework
student.homeworks
student.to_work!(homework)
student.homeworks
# mentor see notification about homework to work
mentor.notifications_list
# mentor mark as read all notifications
mentor.mark_as_read!
mentor.notifications_list
# student can see homeworks
student.homeworks
# student add answer to homework
student.add_answer!(homework, 'new students answer')
# student sent to check homework
student.to_check!(homework)
# mentor see notification about homework to check
mentor.notifications_list
# mentor reject homework
mentor.reject_to_work!(homework)
# student see notification about homework was reject
student.notifications_list
# ---
student.add_answer!(homework, 'new students answer_after reject')
student.to_check!(homework)
# ---
# mentor accept homework
mentor.accept!(homework)
# student see notification about homework was accept
student.notifications_list

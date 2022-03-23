# frozen_string_literal: true

require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'
require_relative 'lib/file_manager'
require_relative 'lib/user'
student = Student.new(name: 'Dima', surname: 'Doe')
mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')

homework = mentor.add_homework(title: 'HW03',
                               description: 'description homework',
                               student: student)
# invite a student to work
mentor.invite_student_to_work(homework)
# create file with homework
homework.add_homework_file
# student see notification about new homework
student.notifications
# student mark as read all notifications
student.mark_as_read!
# mentor subscribe to homework
mentor.subscribe_to!(homework)
# student see homeworks data
student.homeworks
# student take to work andsubscribe to homework
student.to_work!(homework)
# student see homeworks data
student.homeworks
# mentor see notification about homework to work
mentor.notifications
# mentor mark as read all notifications
mentor.mark_as_read!
mentor.notifications
# student can see homeworks
student.homeworks
# student add answer to homework
student.add_answer!(homework, 'new students answer')
# student sent to check homework
student.to_check!(homework)
# mentor see notification about homework to check
mentor.notifications
# mentor reject homework
mentor.reject_to_work!(homework, 'bad')
# student see notification about homework was reject
student.notifications
# student mark as read all notifications
student.mark_as_read!
# student add answer to homework
student.add_answer!(homework, 'new students answer_after reject')
# student sent to check homework
student.to_check!(homework)
# mentor accept homework
mentor.accept!(homework)
# student see notification about homework was accept
student.notifications

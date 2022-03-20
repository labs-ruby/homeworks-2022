# frozen_string_literal: true

require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'
require_relative 'lib/file_module'

student = Student.new(name: 'Ivan', surname: 'Klimov')
mentor = Mentor.new(name: 'Olga', surname: 'Urban')

# mentor add new homework
homework = mentor.add_homework(title: 'task1',
                               description: 'Solve (2+3*2) using eval method.',
                               student: student)

# student see notification about new homework
student.notifications(homework)
# student mark as read all notifications
student.mark_as_read!(mentor)
# mentor subscribe to student
mentor.subscribe_to!(student)
# student take to work homework
student.homeworks
student.to_work!(mentor, homework)
student.homeworks
# mentor see notification about homework to work
# mentor mark as read all notifications
mentor.mark_as_read!
# student can see homeworks
student.homeworks
# student add answer to homework
student.add_answer!(homework, 'p (2+3*6).')
# student sent to check homework
student.to_check!(mentor, homework)
# mentor see notification about homework to check
# mentor reject homework
mentor.reject_to_work!(student, homework)
# student see notification about homework was reject
# ---
student.add_answer!(homework, 'p eval(2+3*6).')
student.to_check!(mentor, homework)
# ---
# mentor accept homework
mentor.accept!(student, homework)
# student see notification about homework was accept
# student.notifications

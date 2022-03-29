# frozen_string_literal: true

require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'

student = Student.new(name: 'Ivan', surname: 'Klimov')
mentor = Mentor.new(name: 'Olga', surname: 'Urban')

# mentor add new homework
homework = mentor.add_homework(title: 'task1',
                               description: 'Solve (2+3*2) using eval method.',
                               student: student)

# student see notification about new homework
p student.notifications
# student mark as read all notifications
student.mark_as_read!
# mentor subscribe to student
mentor.subscribe_to!(student)
# student take to work homework
p student.homeworks
student.to_work!(mentor, homework)
p student.homeworks
# mentor see notification about homework to work
p mentor.notifications
# mentor mark as read all notifications
mentor.mark_as_read!
p mentor.notifications
# student can see homeworks
p student.homeworks
# student add answer to homework
student.add_answer!(homework, ' 2+3*2 ')
# student sent to check homework
student.to_check!(mentor, homework)
# mentor see notification about homework to check
p mentor.notifications
# mentor reject homework
mentor.reject_to_work!(student, homework)
# student see notification about homework was reject
p student.notifications
# ---
student.add_answer!(homework, 'eval(2+3*2)')
student.to_check!(mentor, homework)
# ---
# mentor accept homework
mentor.accept!(student, homework)
# student see notification about homework was accept
p student.notifications

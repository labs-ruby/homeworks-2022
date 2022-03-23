# frozen_string_literal: true

require_relative 'lib/student'
require_relative 'lib/mentor'
require_relative 'lib/homework'
require_relative 'lib/notification'
require 'colorize'

student = Student.new(name: 'Siarhei', surname: 'Pratasevich')
mentor = Mentor.new(name: 'Jack', surname: 'Gonsales')
homework = mentor.add_homework(title: 'HW03',
                               description: '5!(factorial). Using method reduce',
                               student: student)

student.notifications
# # student mark as read all notifications
student.mark_as_read!
# # mentor subscribe to student
mentor.subscribe_to!(student)
# # student take to work homework
student.homeworks
student.to_work!(homework)
student.homeworks
# # mentor see notification about homework to work
mentor.notifications(student)
# # mentor mark as read all notifications
mentor.mark_as_read!(student)
mentor.notifications(student)
# # student can see homeworks
student.homeworks
# # student add answer to homework
student.add_answer!(homework, '(1..5).to_a.reduce(:+)')
# # student sent to check homework
student.to_check!(homework)
# # mentor see notification about homework to check
mentor.notifications(student)
# # mentor reject homework
mentor.reject_to_work!(homework, student)
# # student see notification about homework was reject
student.notifications
# # ---
student.add_answer!(homework, '(1..5).to_a.reduce(:*)')
student.to_check!(homework)
# # ---
# mentor accept homework
mentor.accept!(homework, student)
# # student see notification about homework was accept
student.notifications

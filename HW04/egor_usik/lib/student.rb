# frozen_string_literal: true

require_relative 'person'

class Student < Person
  def initialize(name:, surname:)
    super

    @homeworks = []
  end

  def homeworks
    return '> There are no new homeworks.' if number_of_homeworks.zero?

    puts "Homeworks:\n"
    @homeworks.each { |hw| puts "- #{hw.title} (#{hw.description})." }
  end

  def add_homework(homework)
    @homeworks << homework
  end

  def to_work!(homework)
    homework.creator.add_notification(Notification.new('Homework started.',
                                                       "Student '#{fullname}' \
                                                       has started doing homework '#{homework.title}'."))
    homework.mark_as_executing!
  end

  def add_answer!(homework, answer)
    homework.creator.add_notification(Notification.new('Answer was added.',
                                                       "Student '#{fullname}' \
                                                       added the answer for homework '#{homework.title}' just now."))
    homework.add_answer(answer)
  end

  def to_check!(homework)
    homework.creator.add_notification(Notification.new('Homework is done.',
                                                       "Homework '#{homework.title}' \
                                                       needs to be checked."))
    homework.mark_as_done!
  end

  private

  def number_of_homeworks
    @homeworks.size
  end
end

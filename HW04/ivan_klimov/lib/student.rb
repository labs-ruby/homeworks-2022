# frozen_string_literal: true

require_relative '../lib/notification'
require_relative '../lib/person'
require_relative '../lib/homework'

class Student < Person
  def initialize(name:, surname:)
    super
    create_homeworks_file(self)
  end

  def notifications(homework)
    notification_for_student(self, notification(homework.title))
  end

  def mark_as_read!(mentor)
    notification_for_mentor(mentor, notification("#{name} #{surname} #{read_all}"))
  end

  def homeworks
    read_file_hw(self)
  end

  def to_work!(mentor, homework)
    notification_for_mentor(mentor, notification("#{name} #{surname} took to work #{homework.title}."))
  end

  def add_answer!(homework, ans)
    create_answer_file(self, homework, ans)
  end

  def to_check!(mentor, homework)
    notification_for_mentor(mentor, notification("#{name} #{surname} sent answer to check #{homework.title}."))
  end
end

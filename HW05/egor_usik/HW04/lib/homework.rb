# frozen_string_literal: true

module HomeworkStatuses
  NEW = 0
  EXECUTING = 1
  DONE = 2
  REJECTED = 3
  ACCEPTED = 4
end

class Homework
  include HomeworkStatuses

  attr_accessor :title, :description, :creator
  attr_reader :answers, :status

  def initialize(title, description)
    @title = title
    @description = description
    @status = HomeworkStatuses::NEW
    @creator = nil
    @answers = []
  end

  def add_answer(answer)
    @answers << answer
  end

  def mark_as!(status)
    raise StandardError, 'The status of accepted homework can not be changed.' if accepted?
    raise StandardError, 'The status of homework can not be changed to NEW.' if status.zero? && @status != 0
    if status == 3 && executing?
      raise StandardError, 'The status of the homework is executing can not be changed to REJECTED.'
    end

    @status = status
  end

  protected

  def executing?
    @status == HomeworkStatuses::EXECUTING
  end

  def done?
    @status == HomeworkStatuses::DONE
  end

  def rejected?
    @status == HomeworkStatuses::REJECTED
  end

  def accepted?
    @status == HomeworkStatuses::ACCEPTED
  end
end

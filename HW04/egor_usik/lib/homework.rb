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

  def mark_as_executing!
    @status = HomeworkStatuses::EXECUTING
  end

  def mark_as_done!
    @status = HomeworkStatuses::DONE
  end

  def mark_as_rejected!
    @status = HomeworkStatuses::REJECTED
  end

  def mark_as_accepted!
    @status = HomeworkStatuses::ACCEPTED
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

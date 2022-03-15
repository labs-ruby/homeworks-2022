# frozen_string_literal: true

class Homework
  def initialize(data, mentor)
    @title = data[:title]
    @description = data[:desription]
    @student = data[:student]
    @mentor = mentor
    @status = 'new'
    @answers = []
    @to_check = []
  end

  def add_answer!(answer)
    @answers << answer
  end

  def change_status(status)
    @status = status
    @to_check.clear
  end

  attr_reader :title

  def to_check!(_name, _surname)
    change_status('in progress')
    @to_check << self
  end
end

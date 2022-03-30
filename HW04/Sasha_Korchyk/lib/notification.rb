# frozen_string_literal: true

class Notification
  attr_accessor :seen
  attr_reader :type, :person, :title, :description, :answer

  def initialize(title, description, type, person, answer = '')
    @title = title
    @description = description
    @seen = false
    @type = type
    @person = person
    @answer = answer
  end
end

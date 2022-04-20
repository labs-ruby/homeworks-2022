# frozen_string_literal: true

require_relative 'notification'

class Person
  include Notification
  attr_reader :name, :surname, :notifications, :homeworks

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notifications = []
    @homeworks = []
  end
end

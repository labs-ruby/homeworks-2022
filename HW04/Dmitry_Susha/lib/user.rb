# frozen_string_literal: true

require_relative 'homework_observable'
require_relative 'notification'
class User
  include HomeworkObservable
  include Notification
  attr_reader :name, :surname

  def initialize(name:, surname:)
    @name = name
    @surname = surname
  end
end

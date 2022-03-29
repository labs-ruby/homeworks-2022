# frozen_string_literal: true

require_relative 'notification'

class Person
  include Notification
  attr_reader :name, :surname

  def initialize(name:, surname:)
    @notes = []
    @name = name
    @surname = surname
  end
end

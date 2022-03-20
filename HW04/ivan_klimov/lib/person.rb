# frozen_string_literal: true

require_relative 'file_module'

class Person
  include Notification
  include LogSystem
  attr_reader :name, :surname

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    create_log_file(person: self)
  end
end

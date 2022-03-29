# frozen_string_literal: true

require_relative '../lib/notification'

class Participant
  include Notification
  attr_reader :name, :surname

  def initialize(name:, surname:)
    @name = name
    @surname = surname
  end
end

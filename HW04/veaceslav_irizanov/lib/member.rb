# frozen_string_literal: true

class Member
  include Notification
  attr_reader :name, :surname

  def initialize(name:, surname:)
    @name = name
    @surname = surname
  end
end

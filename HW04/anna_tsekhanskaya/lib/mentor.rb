# frozen_string_literal: true

class Mentor
  def initialize
    @firstname = firstname
    @lastname = lastname
    @noties_for_student = []
  end

  # mentor add new homework
  def add_homework(title:, description:, student:)
    puts title
    noties_for_student << "Add homework at #{Time.now}"
  end

  def subscribe_to; end

  def accept; end
end

# frozen_string_literal: true

class Mentor < Member
  def notifications; end

  def add_homework(title:, description:, student:); end

  def subscribe_to!(student); end

  def mark_as_read!; end

  def reject_to_work!(homework); end

  def accept!(homework); end
end

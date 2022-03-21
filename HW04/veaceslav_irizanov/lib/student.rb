# frozen_string_literal: true

require_relative '../lib/notification'
require_relative '../lib/member'

class Student < Member
  def notifications; end

  def mark_as_read!; end

  def homeworks; end

  def to_works!(homework); end

  def add_answer!(homework, 'new students answer'); end

  def to_check!(homework); end
end

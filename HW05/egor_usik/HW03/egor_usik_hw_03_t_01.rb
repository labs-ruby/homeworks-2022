# frozen_string_literal: true

require_relative 'expressions'

class Homework3
  def task1(text)
    return '' if text.nil?

    text.match(Expressions::ERROR_LOG_LINE).to_s || ''
  end
end

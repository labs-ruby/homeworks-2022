# frozen_string_literal: true

class Expressions
  ERROR_LOG_LINE = /^(.*error).*$/
  POST_REQUEST = /^(\d+.\d+.\d+.\d+) - - \[(.*?)\] "POST (.*) .*".*$/
  CALLING_CORE_REQUEST = /(\d+-\d+-\d+ \d+:\d+:\d+\.\d+) ?.* - Calling core.*$/
  LETTERS = /[A-Za-z]/
  DIGITS = /[0-9]/
end

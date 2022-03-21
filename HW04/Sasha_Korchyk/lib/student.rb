# frozen_string_literal: true

require_relative '../lib/notification'
require_relative '../lib/homework'

class Student
  include Notification
  include StudentHomework

  attr_accessor :data
  attr_reader :name, :surname

  def initialize(hash)
    @name = hash[:name]
    @surname = hash[:surname]
    @data = { notify: [], homeworks: [] }
  end

  def to_work!(homework)
    @data[:homeworks].each do |i|
      i[true] = i.delete false if i.value? "Title: #{homework[:title]}, description: #{homework[:description]}"
    end
    homework[:mentor].data[:notify] << { false => "#{@name} #{@surname} started homework: " \
                                                    "Title: #{homework[:title]}," \
                                                    "description: #{homework[:description]}" }
  end

  def add_answer!(homework, answer)
    homework[:answer] = answer
  end

  def to_check!(homework)
    homework[:mentor].data[:homeworks] << { false => "Title: #{homework[:title]}, " \
                                                      "description: #{homework[:description]}, " \
                                                      "answer: #{homework[:answer]}" }
    homework[:mentor].data[:notify] << { false => "#{@name} #{@surname} add answer to homework: " \
                                                    "Title: #{homework[:title]}, " \
                                                    "description: #{homework[:description]}, " \
                                                    "answer: #{homework[:answer]}" }
  end
end

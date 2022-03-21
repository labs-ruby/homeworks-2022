# frozen_string_literal: true

class Mentor
  include Notification

  attr_accessor :data
  attr_reader :name, :surname

  def initialize(hash)
    @name = hash[:name]
    @surname = hash[:surname]
    @data = { notify: [], homeworks: [], subscriptions: [] }
  end

  def add_homework(title:, description:, student:)
    student.data[:homeworks] << { false => "Title: #{title}, description: #{description}" }
    student.data[:notify] << { false => "Mentor added new homework: #{title}, description: #{description}" }
    { title: title, description: description, mentor: self, student: student }
  end

  def subscribe_to!(student)
    @data[:subscriptions] << "#{student.name} #{student.surname}"
    @data[:notify] << { false => "You subscribed to: #{student.name} #{student.surname}" }
    student.data[:notify] << { false => "#{@name} #{@surname} subscribed to you" }
  end

  def reject_to_work!(homework)
    @data[:homeworks].each do |i|
      if i.value? "Title: #{homework[:title]}, description: #{homework[:description]}, answer: #{homework[:answer]}"
        i.delete(false)
      end
    end
    homework[:student].data[:notify] << { false => "Mentor reject homework: Title: #{homework[:title]}, " \
                                                    "description: #{homework[:description]}, " \
                                                    "your answer: #{homework[:answer]}" }
  end

  def accept!(homework)
    @data[:homeworks].each do |i|
      if i.value? "Title: #{homework[:title]}, description: #{homework[:description]}, answer: #{homework[:answer]}"
        i[true] = i.delete false
      end
    end
    homework[:student].data[:notify] << { false => "Mentor accept homework: Title: #{homework[:title]}, " \
                                                    "description: #{homework[:description]}, " \
                                                    "your answer: #{homework[:answer]}" }
  end
end

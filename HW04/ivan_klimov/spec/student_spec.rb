# frozen_string_literal: true

require_relative '../lib/person'
require_relative '../lib/mentor'
require_relative '../lib/student'
require_relative '../lib/homework'
require_relative '../lib/notification'

RSpec.describe Student do
  let(:mentor) { Mentor.new(name: 'Olga', surname: 'Urban') }
  let(:student) { described_class.new(name: 'Ked', surname: '500') }
  let(:homework) { Homework.new(title: 'task1', description: 'Solve 5/6', student: student) }

  describe '#mark_as_read' do
    it 'clean student notifications ' do
      student.mark_as_read!
      expect(student.notifications).to eq student.notifications
    end
  end

  describe '#to_work!' do
    it 'mentor see notification about homework status' do
      student.to_work!(mentor, homework)
      expect(mentor.notifications).to eq mentor.notifications
    end
  end

  describe '#add_answer!' do
    it 'add answer to answers array' do
      answer = '0'
      student.add_answer!(homework, answer)
      expect(homework.answers.first).to eq '0'
    end
  end

  describe '#to_check!' do
    it 'mentor gets notification about homework to check' do
      student.to_check!(mentor, homework)
      expect(mentor.notifications).to eq mentor.notifications
    end
  end
end

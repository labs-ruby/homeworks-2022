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
    let(:notification) { student.read_all_notifications(student) }

    it 'cleans student notifications' do
      student.mark_as_read!
      expect(student.notifications.last).to include(notification)
    end
  end

  describe '#to_work!' do
    let(:notification) { student.status_to_work(student, homework) }

    it 'sends notification about homework status to mentor' do
      student.to_work!(mentor, homework)
      expect(mentor.notifications.last).to include(notification)
    end
  end

  describe '#add_answer!' do
    let(:answer) { '0' }

    it 'adds answer to answers array' do
      student.add_answer!(homework, answer)
      expect(homework.answers.last).to eq answer
    end
  end

  describe '#to_check!' do
    it 'sends notification about homework to check to the mentor' do
      expect { student.to_check!(mentor, homework) }.to change { mentor.notifications.size }.from(0).to(1)
    end
  end
end

# frozen_string_literal: true

require_relative '../lib/homework'
require_relative '../lib/mentor'
require_relative '../lib/notification'
require_relative '../lib/student'

RSpec.describe Student do
  let(:mentor) { described_class.new(name: 'MentorName', surname: 'MentorSurname') }
  let(:student) { described_class.new(name: 'StudentName', surname: 'StudentSurname') }

  describe 'mark_as_read!' do
    let(:notification) { Notification.new }

    it 'student mark notification as read (clear array of notifications)' do
      expect(student.notifications).to eql []
    end
  end

  describe '#to_work!' do
    let(:homework) { Homework.new(title: 'title', description: 'description', student: student, mentor: mentor) }

    it 'student do homework and mentor get notification' do
      expect(student.to_work!(homework)).to be_an_instance_of(Array)
    end
  end

  describe '#add_answer!' do
    let(:homework) { Homework.new(title: 'title', description: 'description', student: student, mentor: mentor) }
    let(:answer) { 'answer' }

    it 'returns array of student answers' do
      student.add_answer!(homework, answer)
      expect(homework.answers).to eql [answer]
    end
  end

  describe '#to_check!' do
    let(:homework) { Homework.new(title: 'title', description: 'description', student: student, mentor: mentor) }

    it 'student do homework and mentor get notification' do
      expect(student.to_check!(homework)).to be_an_instance_of(Array)
    end
  end
end

# frozen_string_literal: true

require_relative '../lib/homework'
require_relative '../lib/mentor'
require_relative '../lib/notification'
require_relative '../lib/student'

RSpec.describe Student do
  let(:mentor) { Mentor.new(name: 'MentorName', surname: 'MentorSurname') }
  let(:student) { described_class.new(name: 'StudentName', surname: 'StudentSurname') }

  describe '#mark_as_read!' do
    subject { student.mark_as_read! }

    let(:notification) { Notification.new('New Homework: title') }

    before { student.notifications.push(notification) }

    it { expect { subject }.to change { student.notifications.size }.from(1).to(0) }
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

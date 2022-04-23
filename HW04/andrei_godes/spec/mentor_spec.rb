# frozen_string_literal: true

require 'pry'
require_relative '../lib/homework'
require_relative '../lib/mentor'
require_relative '../lib/notification'
require_relative '../lib/student'

RSpec.describe Mentor do
  let(:mentor) { described_class.new(name: 'MentorName', surname: 'MentorSurname') }
  let(:student) { Student.new(name: 'StudentName', surname: 'StudentSurname') }
  let(:homework) { described_class.new(name: 'MentorName', surname: 'MentorSurname').add_homework(title: 'title', description: 'description', student: student) }
  let(:notification) { Notification.new('New Homework: title') }

  describe '#add_homework' do
    it 'adds new homework to student' do
      mentor.add_homework(title: 'title', description: 'description', student: student)

      expect(student.homeworks).to include(homework)
    end

    # it 'adds new notification to student' do
    #   mentor.add_homework(title: 'title', description: 'description', student: student)
    #   # binding.pry

    #   expect(student.notifications).to include(notification)
    # end

    it 'returns an object of class Homework' do
      expect(homework).to be_a(Homework)
    end
  end

  describe '#subscribe_to!' do
    before { mentor.subscribe_to!(student) }

    it 'returns array of mentor subscriptions' do
      expect(mentor.subscriptions).to eql [student]
    end
  end

  describe '#mark_as_read!' do
    subject { mentor.mark_as_read! }

    before { mentor.notifications.push(notification) }

    it { expect { subject }.to change { mentor.notifications.size }.from(1).to(0) }
  end

  describe '#reject_to_work!' do
    it 'mentor reject homework and student get notification' do
      expect(mentor.reject_to_work!(homework)).to be_an_instance_of(Array)
    end
  end

  describe '#accept!' do
    it 'mentor accept homework and student get notification' do
      expect(mentor.accept!(homework)).to be_an_instance_of(Array)
    end
  end
end

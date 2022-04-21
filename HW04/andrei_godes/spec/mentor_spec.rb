# frozen_string_literal: true

require_relative '../lib/homework'
require_relative '../lib/mentor'
require_relative '../lib/notification'
require_relative '../lib/student'

RSpec.describe Mentor do
  let(:mentor) { described_class.new(name: 'MentorName', surname: 'MentorSurname') }
  let(:student) { Student.new(name: 'StudentName', surname: 'StudentSurname') }
  let(:homework) { Homework.new(title: 'title', description: 'description', student: student, mentor: mentor) }

  describe '#add_homework' do
    before do
      allow(mentor).to receive(:add_homework).and_return(:homework)
    end

    it 'returns an object of class Homework' do
      expect(homework).to be_a(Homework)
    end
  end

  describe '#subscribe_to!' do
    it 'returns array of mentor subscriptions' do
      mentor.subscribe_to!(student)
      expect(mentor.subscriptions).to eql [student]
    end
  end

  describe '#mark_as_read!' do
    let(:notification) { Notification.new }

    it 'clears the array of notifications' do
      expect(mentor.notifications).to eql []
    end
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

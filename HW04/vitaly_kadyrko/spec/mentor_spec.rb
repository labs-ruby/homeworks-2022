# frozen_string_literal: true

require_relative '../lib/homework'
require_relative '../lib/mentor'
require_relative '../lib/student'
require_relative '../lib/notification'

RSpec.describe Mentor do
  let(:student) { Student.new(name: 'Test', surname: 'Student') }
  let(:mentor) { described_class.new(name: 'Test', surname: 'Mentor') }
  let(:homework) { mentor.add_homework(title: 'Test title', description: 'Test description', student: student) }

  context 'when add_homework method used' do
    it 'return Homework class object' do
      expect(homework).to be_a(Homework)
    end
  end

  context 'when subscribe_to! method used' do
    it 'return subscriptions list' do
      mentor.subscribe_to!(student)
      expect(mentor.subscriptions).to eq [student]
    end
  end

  context 'when mark_as_read! method used' do
    it 'return empty notifications array' do
      expect(mentor.notifications).to eq []
    end
  end

  context 'when reject_to_work! method used' do
    it 'add rejection in notification array' do
      expect { mentor.reject_to_work!(homework) }.to change { student.notifications.size }.to(1)
    end
  end

  context 'when accept! method used' do
    it 'homework status switch to accepted!' do
      mentor.accept!(homework)
      expect(homework.status).to eq 'Accepted'
    end
  end
end

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

    it 'add new_homework_message to student notifications array' do
      expect(student.notifications[0]).to eq "New homework '#{homework.title}' was added"
    end

    it 'add new homework to student homeworks array' do
      expect(student.homeworks[0]).to eq homework
    end
  end

  context 'when subscribe_to! method used' do
    it 'add student to subscriptions array' do
      described_class.subscribe_to!(student)
      expect(described_class.subscriptions).to eq [student]
    end
  end

  context 'when mark_as_read! method used' do
    it 'return empty notifications array' do
      expect(described_class.notifications).to eq []
    end
  end

  context 'when reject_to_work! method used' do
    it 'add reject_work_message to student notification array' do
      expect { described_class.reject_to_work!(homework) }.to change { student.notifications.size }.to(1)
    end

    it 'homework status switch to rejected' do
      described_class.reject_to_work!(homework)
      expect(homework.status).to eq 'Rejected'
    end
  end

  context 'when accept! method used' do
    it 'add accept_message to student notifications array' do
      expect(student.notifications[0]).to eq "Homework '#{homework.title}' was accepted"
    end

    it 'homework status switch to accepted!' do
      described_class.accept!(homework)
      expect(homework.status).to eq 'Accepted'
    end
  end
end

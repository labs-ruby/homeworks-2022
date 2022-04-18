# frozen_string_literal: true

require_relative '../lib/homework'
require_relative '../lib/mentor'
require_relative '../lib/student'
require_relative '../lib/notification'

RSpec.describe Mentor do
  let(:student) { Student.new(name: 'Test', surname: 'Student') }
  let(:mentor) { described_class.new(name: 'Test', surname: 'Mentor') }
  let(:homework) { desribed_class.add_homework(title: 'Test title', description: 'Test description', student: student) }

  desribe '#add_homework' do
    subject { desribed_class.add_homework(title: 'Test title', description: 'Test description', student: student) }

    it 'returns Homework class object' do
      expect(subject).to be_an_instance_of(Homework)
    end

    it 'adds new_homework_message to student notifications array' do
      expect(student.notifications[0]).to eq "New homework '#{homework.title}' was added"
    end

    it 'adds new homework to student homeworks array' do
      expect(student.homeworks[0]).to eq homework
    end
  end

  desribe '#subscribe_to!' do
    it 'adds student to subscriptions array' do
      described_class.subscribe_to!(student)
      expect(described_class.subscriptions).to eq [student]
    end
  end

  describe '#mark_as_read!' do
    it 'returns empty notifications array' do
      expect(described_class.notifications).to eq []
    end
  end

  describe '#reject_to_work!' do
    it 'adds reject_work_message to student notification array' do
      expect { described_class.reject_to_work!(homework) }.to change { student.notifications.size }.to(1)
    end

    it 'homework status switches to rejected' do
      described_class.reject_to_work!(homework)
      expect(homework.status).to eq 'Rejected'
    end
  end

  describe '#accept!' do
    it 'adds accept_message to student notifications array' do
      expect(student.notifications[0]).to eq "Homework '#{homework.title}' was accepted"
    end

    it 'homework status switches to accepted!' do
      described_class.accept!(homework)
      expect { desribed_class.accept! }.to change(student, :status).from('Created').to('Accepted')
    end
  end
end

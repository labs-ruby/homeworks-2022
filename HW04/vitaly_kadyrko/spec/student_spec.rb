# frozen_string_literal: true

require_relative '../lib/homework'
require_relative '../lib/mentor'
require_relative '../lib/student'
require_relative '../lib/notification'

RSpec.describe Student do
  let(:student) { described_class.new(name: 'Test', surname: 'Student') }
  let(:mentor) { mentor.new(name: 'Test', surname: 'Mentor') }
  let(:homework) { mentor.add_homework(title: 'Test title', description: 'Test description', student: student) }

  describe '#mark_as_read!' do
    subject { desribed_class.notifications }

    it 'returns empty notifications array' do
      described_class.to_work!(homework)
      described_class.mark_as_read!
      expect(subject).to eq []
    end
  end

  describe '#to_work!' do
    it 'adds new to_work message to mentor notifications array' do
      described_class.to_work!(homework)
      expect(mentor.notifications[0]).to eq "Homework '#{homework.title}' was started"
    end

    it 'switches homework status to in progress' do
      described_class.to_work!(homework)
      expect(homework.status).to eq 'In progress'
    end
  end

  describe '#add_answer!' do
    it 'returns object of homework class' do
      expect(described_class.add_answer!(homework, 'Test answer')).to eq homework.answers
    end
  end

  describe '#to_check!' do
    it 'adds new to_check message to mentor notifications array' do
      described_class.to_check!(homework)
      expect(mentor.notifications[0]).to eq "New answers to homework '#{homework.title}' was added"
    end

    it 'switches homework status to awaiting to check ' do
      described_class.to_check!(homework)
      expect(homework.status).to eq 'Awaiting to check'
    end
  end
end

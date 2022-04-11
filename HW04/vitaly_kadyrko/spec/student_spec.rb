require_relative '../lib/homework'
require_relative '../lib/mentor'
require_relative '../lib/student'
require_relative '../lib/notification'

RSpec.describe Student do
  let(:student) { Student.new(name: 'Test', surname: 'Student') }
  let(:mentor) { described_class.new(name: 'Test', surname: 'Mentor') }
  let(:homework) { mentor.add_homework(title: 'Test title', description: 'Test description', student: student) }

  context 'when mark_as_read! method used' do
    it 'return empty notifications array' do
        student.to_work!(homework)
        student.mark_as_read!
        expect(student.notifications).to eq []
    end
  end

  context 'when to_work! method used' do
    it 'switch homework status to in progress' do
        student.to_work!(homework)
        expect(homework.status).to eq 'In progress'
    end
  end

  context 'when add_answer! method used' do
    it 'return object of homework class' do
        expect(student.add_answer!(homework, 'Test answer')).to eq homework.answers
  end

  context 'when to_check! method used' do
    it 'switch homework status to awaiting to check ' do
        student.to_check!(homework)
        expect(homework.status).to eq 'Awaiting to check'
    end
  end
end
  
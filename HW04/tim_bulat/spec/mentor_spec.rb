# frozen_string_literal: true

require_relative '../lib/student'
require_relative '../lib/mentor'
require_relative '../lib/homework'
require_relative '../lib/notification'

RSpec.describe Mentor do
  let(:student) { Student.new(name: 'students_name', surname: 'students_surname') }
  let(:mentor) { described_class.new(name: 'mentor_name', surname: 'mentor_surname') }
  let(:homework) { Homework.new(title: 'title', description: 'description', student: student, mentor: mentor) }

  describe '#subscribe_to!' do
    context 'when subscribed to student' do
      it 'adds needed student to list' do
        mentor.subscribe_to!(student)
        expect(mentor.students).to include student
      end
    end
  end

  describe '#add_homework!' do
    subject { mentor.add_homework(title: 'title', description: 'description', student: student) }

    it 'returns Homework object' do
      expect(subject).to be_a Homework
    end

    it 'notifies student' do
      expect { subject }.to change { student.notes.size }.from(0).to(1)
    end
  end

  describe '#reject_to_work!' do
    subject { mentor.reject_to_work!(homework) }

    it 'changes status of homework to rejected' do
      expect { subject }.to change(homework, :status).to 'rejected'
    end

    it 'notifies student' do
      expect { subject }.to change { student.notes.size }.from(0).to(1)
    end
  end

  describe '#accept!' do
    subject { mentor.accept!(homework) }

    it 'changes status of homework to accepted' do
      expect { subject }.to change(homework, :status).to 'accepted'
    end

    it 'notifies student' do
      expect { subject }.to change { student.notes.size }.from(0).to(1)
    end
  end
end

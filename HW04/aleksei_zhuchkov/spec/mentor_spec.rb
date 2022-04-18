# frozen_string_literal: true

require_relative '../lib/mentor'
require_relative '../lib/notification'
require_relative '../lib/student'
require_relative '../lib/homework'

RSpec.describe Mentor do
  let(:student) { Student.new(name: 'student_name', surname: 'student_surname') }
  let(:mentor) { described_class.new(name: 'mentor_name', surname: 'mentor_surname') }
  let(:homework) do
    mentor.add_homework(title: 'test_title',
                        description: 'test_description',
                        student: student)
  end

  describe '#add_homework' do
    let(:homework_test) do
      mentor.add_homework(title: 'test_title',
                          description: 'test_description',
                          student: student)
    end

    it 'returns the homework of Homework class' do
      expect(homework_test).to be_an_instance_of(Homework)
    end

    it 'returns the right value homework description' do
      expect(homework_test.description).to eq('test_description')
    end

    it 'returns the right value homework title' do
      expect(homework_test.title).to eq('test_title')
    end
  end

  describe '#subscride' do
    context 'when mentor subscribe to student' do
      it 'returns instance of class Array' do
        expect(mentor.subscribe_to!(student)).to be_an_instance_of(Array)
      end

      it 'returns not empty array of student list' do
        mentor.subscribe_to!(student)
        expect(mentor.students_list).not_to be_empty
      end
    end
  end

  describe '#notification' do
    context 'when notifications do not add' do
      it 'returns the instanse of class Array' do
        expect(mentor.notifications).to be_an_instance_of(Array)
      end

      it 'returns array is empty' do
        expect(mentor.notifications).to be_empty
      end
    end

    context 'when notifications add' do
      it 'returns array is not empty' do
        student.to_work!(homework)
        expect(mentor.notifications).not_to be_empty
      end
    end
  end

  describe '#mark_as_read!' do
    it 'returns empty Array' do
      expect(mentor.mark_as_read!).to be_empty
    end
  end

  describe '#status_homework' do
    context 'when used method reject_to_work!' do
      it 'return status homework "rejected"' do
        mentor.reject_to_work!(homework)
        expect(homework.status_homework).to eq('rejected')
      end
    end

    context 'when used method accepted!' do
      it 'change status homework to accepted' do
        mentor.accept!(homework)
        expect(homework.status_homework).to eq('accepted')
      end
    end
  end
end

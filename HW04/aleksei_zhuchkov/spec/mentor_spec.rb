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

    it 'add homework to student to be a instance of class Homework' do
      expect(homework_test).to be_an_instance_of(Homework)
    end

    it 'check right value homework description' do
      expect(homework_test.description).to eq('test_description')
    end

    it 'check right value homework title' do
      expect(homework_test.title).to eq('test_title')
    end
  end

  describe '#subscride' do
    context 'when mentor subscribe to student' do
      it 'returns instance of class Array' do
        expect(mentor.subscribe_to!(student)).to be_an_instance_of(Array)
      end

      it 'return not empty array of student list' do
        mentor.subscribe_to!(student)
        expect(mentor.students_list).not_to be_empty
      end
    end
  end

  describe '#notification' do
    context 'when notifications do not add' do
      it 'return value is instanse of class Array' do
        expect(mentor.notifications).to be_an_instance_of(Array)
      end

      it 'in first time notification is empty' do
        expect(mentor.notifications).to be_empty
      end
    end

    context 'when notifications add' do
      it 'return array is not empty' do
        student.to_work!(homework)
        expect(mentor.notifications).not_to be_empty
      end
    end
  end

  describe '#mark_as_read!' do
    it 'return empty Array' do
      expect(mentor.mark_as_read!).to be_empty
    end
  end

  describe '#status_homework' do
    context 'when check method reject_to_work!' do
      it 'change status homework to rejected' do
        mentor.reject_to_work!(homework)
        expect(homework.status_homework).to eq('rejected')
      end
    end

    describe '#accept!' do
      it 'change status homework to accepted' do
        mentor.accept!(homework)
        expect(homework.status_homework).to eq('accepted')
      end
    end
  end
end

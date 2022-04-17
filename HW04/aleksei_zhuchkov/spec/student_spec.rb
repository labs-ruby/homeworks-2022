# frozen_string_literal: true

require_relative '../lib/mentor'
require_relative '../lib/notification'
require_relative '../lib/student'
require_relative '../lib/homework'

RSpec.describe Student do
  let(:student) { described_class.new(name: 'student_name', surname: 'student_surname') }
  let(:mentor) { Mentor.new(name: 'mentor_name', surname: 'mentor_surname') }
  let(:homework) do
    mentor.add_homework(title: 'test_title',
                        description: 'test_description',
                        student: student)
  end

  describe '#storage_homework' do
    context 'when homework does not add to student' do
      it 'return array is empty' do
        expect(student.storage_homework).to be_empty
      end

      it 'return value is instance of class Array' do
        expect(student.storage_homework).to be_an_instance_of(Array)
      end
    end

    context 'when homework add to student' do
      it 'return array is not empty' do
        expect(student.add_homework_to_student_storage(homework)).not_to be_empty
      end
    end
  end

  describe '#notifications' do
    context 'when check method notifications' do
      it 'return value is instanse of class Array' do
        expect(student.notifications).to be_an_instance_of(Array)
      end

      it 'in first time notification is empty' do
        expect(student.notifications).to be_empty
      end

      it 'return value doesn\'t empty if mentor have notification' do
        student.to_work!(homework)
        expect(student.notifications).not_to be_empty
      end
    end
  end

  describe '#mark_as_read!' do
    context 'when check method mark_as_read' do
      it 'return clear Array' do
        expect(student.mark_as_read!).to be_empty
      end
    end
  end

  describe '#homeworks' do
    context 'when check method homeworks' do
      context 'when we create student' do
        student = described_class.new(name: 'student_name', surname: 'student_surname')
        it 'this method return array' do
          expect(student.homeworks).to be_an_instance_of(Array)
        end

        it 'this method return empty array' do
          expect(student.homeworks.empty?).to eq(true)
        end
      end
    end
  end

  describe '#to_work!' do
    context 'when check method to_work!' do
      it 'change status homework to "in work"' do
        student.to_work!(homework)
        expect(homework.status_homework).to eq('in work')
      end

      it 'add notification to mentor' do
        student.to_work!(homework)
        expect(mentor.notifications.empty?).to eq(false)
      end
    end
  end

  describe '#add_answer!' do
    context 'when check method add_answer!' do
      it 'storage_homework_answer doesn\'t empty when we add answer' do
        student.add_answer!(homework, 'test answer')
        expect(homework.storage_homework_answer.empty?).to eq(false)
      end

      it 'add notification to mentor' do
        student.add_answer!(homework, 'test answer')
        expect(mentor.notifications.empty?).to eq(false)
      end
    end
  end

  describe '#to_check!' do
    context 'when check method to_check!' do
      it 'change status homework to "to check"' do
        student.to_check!(homework)
        expect(homework.status_homework).to eq('to check')
      end

      it 'add notification to mentor' do
        student.to_work!(homework)
        expect(mentor.notifications.empty?).to eq(false)
      end
    end
  end
end

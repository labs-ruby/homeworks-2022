# frozen_string_literal: true

require_relative '../../mentor'
require_relative '../../notification'
require_relative '../../student'
require_relative '../../homework'

RSpec.describe Student do
  let(:student) { described_class.new(name: 'student_name', surname: 'student_surname') }
  let(:mentor) { Mentor.new(name: 'mentor_name', surname: 'mentor_surname') }
  let(:homework) do
    mentor.add_homework(title: 'test_title',
                        description: 'test_description',
                        student: student)
  end

  describe 'check method add_homework_to_student_storage' do
    it 'when create instance class student "storage_homework" is empty' do
      expect(student.storage_homework.empty?).to eq(true)
    end

    it 'return value is instance of class Array' do
      expect(student.storage_homework).to be_an_instance_of(Array)
    end

    it 'return doesn\'t empty array when we add homework' do
      expect(student.add_homework_to_student_storage(homework)
      .empty?).to eq(false)
    end
  end

  describe 'check method notifications' do
    it 'return value is instanse of class Array' do
      expect(student.notifications).to be_an_instance_of(Array)
    end

    it 'in first time notification is empty' do
      expect(student.notifications).to eq([])
    end

    it 'return value doesn\'t empty if mentor have notification' do
      student.to_work!(homework)
      expect(student.notifications.empty?).to eq(false)
    end
  end

  describe 'check method mark_as_read' do
    it 'return clear Array' do
      expect(student.mark_as_read!).to eq([])
    end
  end

  describe 'check method homeworks' do
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

  describe 'check method to_work!' do
    it 'change status homework to "in work"' do
      student.to_work!(homework)
      expect(homework.status_homework).to eq('in work')
    end

    it 'add notification to mentor' do
      student.to_work!(homework)
      expect(mentor.notifications.empty?).to eq(false)
    end
  end

  describe 'check method add_answer!' do
    it 'storage_homework_answer doesn\'t empty when we add answer' do
      student.add_answer!(homework, 'test answer')
      expect(homework.storage_homework_answer.empty?).to eq(false)
    end

    it 'add notification to mentor' do
      student.add_answer!(homework, 'test answer')
      expect(mentor.notifications.empty?).to eq(false)
    end
  end

  describe 'check method to_check!' do
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

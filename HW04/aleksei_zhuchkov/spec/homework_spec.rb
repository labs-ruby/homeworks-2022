# frozen_string_literal: true

require_relative '../lib/mentor'
require_relative '../lib/notification'
require_relative '../lib/student'
require_relative '../lib/homework'

RSpec.describe Homework do
  let(:student) { Student.new(name: 'student_name', surname: 'student_surname') }
  let(:mentor) { Mentor.new(name: 'mentor_name', surname: 'mentor_surname') }
  let(:test_homework) { described_class.new('hw_title', 'hw_description', student, mentor) }

  context 'when check information about student and mentor' do
    it 'check right student name' do
      expect(test_homework.student.name).to eq('student_name')
    end

    it 'check right student surname' do
      expect(test_homework.student.surname).to eq('student_surname')
    end

    it 'check right mentor name' do
      expect(test_homework.mentor.name).to eq('mentor_name')
    end

    it 'check right mentor surname' do
      expect(test_homework.mentor.surname).to eq('mentor_surname')
    end
  end

  describe '#print_homework' do
    it 'method return instance of Array' do
      expect(test_homework.print_homework).to be_an_instance_of(Array)
    end

    it 'return correct data' do
      expect(test_homework.print_homework).to eq(%w[hw_title hw_description])
    end
  end
end

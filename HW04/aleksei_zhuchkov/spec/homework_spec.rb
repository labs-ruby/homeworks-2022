# frozen_string_literal: true

require_relative '../lib/mentor'
require_relative '../lib/notification'
require_relative '../lib/student'
require_relative '../lib/homework'

RSpec.describe Homework do
  let(:student) { Student.new(name: 'student_name', surname: 'student_surname') }
  let(:mentor) { Mentor.new(name: 'mentor_name', surname: 'mentor_surname') }
  let(:test_homework) { described_class.new('hw_title', 'hw_description', student, mentor) }

  describe '#print_homework' do
    it 'returns instance of Array' do
      expect(test_homework.print_homework).to be_an_instance_of(Array)
    end

    it 'returns correct data' do
      expect(test_homework.print_homework).to eq(%w[hw_title hw_description])
    end
  end
end

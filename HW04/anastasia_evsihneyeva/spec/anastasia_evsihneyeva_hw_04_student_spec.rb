# frozen_string_literal: true

require_relative '/home/anastasia/Документы/ruby/homeworks-2022/spec/spec_helper'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW04/anastasia_evsihneyeva/lib/mentor'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW04/anastasia_evsihneyeva/lib/student'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW04/anastasia_evsihneyeva/lib/homework'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW04/anastasia_evsihneyeva/lib/notification'

RSpec.describe Student do
  student = described_class.new(name: 'student_name', surname: 'student_surname')

  let(:homework) { Homework.new('title', 'description', student, mentor) }
  let(:mentor) { Mentor.new(name: 'mentor_name', surname: 'mentor_surname') }
  let(:notification) { Notification.new('notification1') }

  context 'when created class object' do
    it 'returns Student object' do
      expect(described_class.new(name: 'Vasya', surname: 'Pupkin')).to be_instance_of(described_class)
    end

    it 'returns ArgumentError' do
      expect { described_class.new }.to raise_error(ArgumentError)
    end
  end

  context 'when student adds homework' do
    it 'returns notification about it' do
      expect(student.to_work!(homework)).to eq homework.mentor.notification_list
    end

    it 'returns all students homeworks' do
      expect(student.homeworks).to eq student.all_hw
    end
  end

  context 'when student adds answer of homework' do
    it 'adds answer to homework answers list' do
      expect(student.add_answer!(homework, 'answer')).to eq homework.answers
    end
  end

  context 'when student sends his homework to check' do
    it 'returns to_check notification' do
      expect(student.to_check!(homework)).to eq homework.mentor.notification_list
    end
  end
end

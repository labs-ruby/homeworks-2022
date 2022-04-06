# frozen_string_literal: true

require_relative '/home/anastasia/Документы/ruby/homeworks-2022/spec/spec_helper'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW04/anastasia_evsihneyeva/lib/mentor'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW04/anastasia_evsihneyeva/lib/student'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW04/anastasia_evsihneyeva/lib/homework'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW04/anastasia_evsihneyeva/lib/notification'

RSpec.describe Notification do
  notification = described_class.new('notification1')

  let(:student) { Student.new(name: 'student_name', surname: 'student_surname') }
  let(:homework) { Homework.new('title', 'description', student, mentor) }
  let(:mentor) { Mentor.new(name: 'mentor_name', surname: 'mentor_surname') }

  context 'when created class object' do
    it 'returns Notification object' do
      expect(described_class.new('some_notification')).to be_instance_of(described_class)
    end

    it 'returns ArgumentError' do
      expect { described_class.new }.to raise_error(ArgumentError)
    end
  end

  context 'when called \'output\' function' do
    it 'returns nil' do
      expect(notification.output).to eq(nil)
    end
  end
end

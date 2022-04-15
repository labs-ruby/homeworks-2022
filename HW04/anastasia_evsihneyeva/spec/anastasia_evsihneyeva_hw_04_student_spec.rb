# frozen_string_literal: true

require_relative "#{File.dirname(__FILE__)}/../lib/homework"
require_relative "#{File.dirname(__FILE__)}/../lib/mentor"
require_relative "#{File.dirname(__FILE__)}/../lib/student"
require_relative "#{File.dirname(__FILE__)}/../lib/notification"
require_relative "#{File.dirname(__FILE__)}/../../../spec/spec_helper.rb"

RSpec.describe Student do
  subject { described_class.new(name: 'student_name', surname: 'student_surname') }

  let(:homework) { Homework.new('title', 'description', subject, mentor) }
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
      expect(subject.to_work!(homework)).to eq homework.mentor.notification_list
    end

    it 'returns all students homeworks' do
      expect(subject.homeworks).to eq subject.all_hw
    end
  end

  context 'when student adds answer of homework' do
    it 'adds answer to homework answers list' do
      expect(subject.add_answer!(homework, 'answer')).to eq homework.answers
    end
  end

  context 'when student sends his homework to check' do
    it 'returns to_check notification' do
      expect(subject.to_check!(homework)).to eq homework.mentor.notification_list
    end
  end
end

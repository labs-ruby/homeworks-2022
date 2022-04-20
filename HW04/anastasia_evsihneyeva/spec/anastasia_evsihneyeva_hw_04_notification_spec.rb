# frozen_string_literal: true

require_relative '../lib/homework'
require_relative '../lib/mentor'
require_relative '../lib/student'
require_relative '../lib/notification'
require_relative '../../../spec/spec_helper'

RSpec.describe Notification do
  subject { described_class.new('notification1') }

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
      expect(subject.output).to eq(nil)
    end

    it 'returns some logs' do
      student.notify(subject, mentor)
      expect(mentor.notifications).to eq(mentor.notification_list)
    end
  end
end

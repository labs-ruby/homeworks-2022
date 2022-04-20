# frozen_string_literal: true

require_relative '../lib/homework'
require_relative '../lib/mentor'
require_relative '../lib/student'
require_relative '../lib/notification'
require_relative '../../../spec/spec_helper'

RSpec.describe Mentor do
  subject { described_class.new(name: 'mentor_name', surname: 'mentor_surname') }

  let(:student) { Student.new(name: 'student_name', surname: 'student_surname') }
  let(:homework) { Homework.new('title', 'description', student, subject) }
  let(:notification) { Notification.new('notification1') }

  context 'when creating an object of Mentor class' do
    it 'returns mentor object' do
      expect(described_class.new(name: 'Petya', surname: 'Ivanov')).to be_instance_of(described_class)
    end
  end

  context 'when mentor adds a homework' do
    it 'returns homework' do
      expect(subject.add_homework(title: 'homework_name', description: 'homework_description', student: student)).to be_instance_of(Homework)
    end
  end

  context 'when mentor subscribes to student' do
    it 'returns list student notifications' do
      expect(subject.subscribe_to!(student)).to eq student.notification_list
    end
  end

  context 'when metor rejects student homework' do
    it 'returns notifications with rejection' do
      expect(subject.reject_to_work!(homework)).to eq student.notification_list
    end
  end

  context 'when mentor accepts student homework' do
    it 'returns accept notification' do
      expect(subject.accept!(homework)).to eq student.notification_list
    end
  end
end

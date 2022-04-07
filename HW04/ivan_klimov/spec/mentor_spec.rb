# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../lib/person'
require_relative '../lib/mentor'
require_relative '../lib/student'
require_relative '../lib/homework'
require_relative '../lib/notification'

RSpec.describe Mentor do
  let(:mentor) { described_class.new(name: 'Olga', surname: 'Urban') }
  let(:student) { Student.new(name: 'Ked', surname: '500') }
  let(:homework) { Homework.new(title: 'task1', description: 'Solve 5/6', student: student) }

  describe '#add_homework' do
    it 'returns homework' do
      test_homework = mentor.add_homework(title: 'task1', description: 'Solve 5/6', student: student)
      expect(test_homework).to be_kind_of(Homework)
    end

    it 'makes notification to the student' do
      test_homework = mentor.add_homework(title: 'task1', description: 'Solve 5/6', student: student)
      expect(student.notifications.first.include?(test_homework.title)).to eq true
    end
  end

  describe '#subscribe_to!' do
    it 'add notification to the student about subscribers' do
      expect(mentor.subscribe_to!(student)).to eq student.notifications
    end
  end

  describe '#mark_as_read' do
    it 'clean mentor notifications ' do
      mentor.mark_as_read!
      expect(mentor.notifications.include?("#{mentor.name}, you have read all notifications.")).to eq true
    end
  end

  describe '#reject_to_work!' do
    it 'add notification to the student about reject homework' do
      mentor.reject_to_work!(student, homework)
      expect(student.notifications.first.include?("Answer for #{homework.title}, was rejected.")).to eq true
    end
  end

  describe '#accept!' do
    it 'add notification to the student about accepted homework' do
      mentor.accept!(student, homework)
      expect(student.notifications.first.include?("Answer for #{homework.title}, was accepted.")).to eq true
    end
  end
end

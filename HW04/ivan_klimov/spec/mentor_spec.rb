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
  let(:test_homework) { mentor.add_homework(title: 'task1', description: 'Solve 5/6', student: student) }

  describe '#add_homework' do
    before { mentor.add_homework(title: 'task1', description: 'Solve 5/6', student: student) }

    it 'returns homework' do
      expect(test_homework).to be_kind_of(Homework)
    end

    it 'makes notification to the student' do
      expect(student.notifications.first).to include(test_homework.title)
    end
  end

  describe '#subscribe_to!' do
    it 'adds notification to the student about subscribers' do
      expect { mentor.subscribe_to!(student) }.to change { student.notifications.size }.from(0).to(1)
    end
  end

  describe '#mark_as_read' do
    let(:notification) { "#{mentor.name}, you have read all notifications." }

    it 'cleans mentor notifications' do
      mentor.mark_as_read!
      expect(mentor.notifications.first).to include(notification)
    end
  end

  describe '#reject_to_work!' do
    let(:notification) { "Answer for #{test_homework.title}, was rejected." }

    it 'adds notification to the student about reject homework' do
      mentor.reject_to_work!(student, test_homework)
      expect(student.notifications[1]).to include(notification)
    end
  end

  describe '#accept!' do
    let(:notification) { "Answer for #{test_homework.title}, was accepted." }

    it 'adds notification to the student about accepted homework' do
      mentor.accept!(student, test_homework)
      expect(student.notifications[1]).to include(notification)
    end
  end
end

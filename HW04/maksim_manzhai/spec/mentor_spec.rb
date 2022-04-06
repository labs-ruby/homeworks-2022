# frozen_string_literal: true

require 'mentor'
require 'student'
require 'homework'
require 'notification'

RSpec.describe Mentor do
  let(:mentor) { described_class.new(name: 'Will', surname: 'Smith') }
  let(:student) { Student.new(name: 'Chris', surname: 'Rock') }
  let(:notification) { Notification.new(title: 'HW03', description: 'OOP in Ruby') }
  let(:homework) { Homework.new(title: 'HW03', description: 'OOP in Ruby', student: student, mentor: mentor) }

  context 'when mentor created' do
    it 'returns name' do
      expect(mentor.name).to eql 'Will'
    end

    it 'returns surname' do
      expect(mentor.surname).to eql 'Smith'
    end
  end

  describe '#add_homework' do
    it 'returns an object of class Homework' do
      homework = mentor.add_homework(title: 'HW03', description: 'OOP in Ruby', student: student)
      expect(homework).to be_a(Homework)
    end
  end

  describe 'mark_as_read!' do
    let(:notification) { Notification.new(title: homework.title, description: 'Homework started') }

    it 'mentor see notification as unreaded' do
      mentor.notifications << notification
      expect(mentor.notifications[0].readed).to be false
    end

    it 'mentor mark as read all notifications' do
      mentor.notifications << notification
      mentor.mark_as_read!
      expect(mentor.notifications[0].readed).to be true
    end
  end
end

# frozen_string_literal: true

require 'student'
require 'notification'
require 'mentor'
require 'homework'

RSpec.describe Student do
  let(:student) { described_class.new(name: 'Chris', surname: 'Rock') }
  let(:mentor) { Mentor.new(name: 'Will', surname: 'Smith') }
  let(:notification) { Notification.new(title: 'HW03', description: 'OOP in Ruby') }
  let(:homework) { Homework.new(title: 'HW03', description: 'OOP in Ruby', student: student, mentor: mentor) }

  context 'when student created' do
    it 'returns name' do
      expect(student.name).to eql 'Chris'
    end

    it 'returns surname' do
      expect(student.surname).to eql 'Rock'
    end
  end

  context 'when student see notification' do
    it 'returns notifications' do
      student.notifications << notification
      expect(student.notifications).to eql [notification]
    end

    it 'student mark as read all notifications' do
      student.notifications << notification
      student.mark_as_read!
      expect(student.notifications[0].readed).to be true
    end
  end

  context 'when student see homeworks' do
    it 'homeworks array is empty' do
      expect(student.homeworks).to eql []
    end

    it 'student got homework' do
      student.homeworks << homework
      expect(student.homeworks).to eql [homework]
    end
  end
end
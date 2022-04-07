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

  describe '#to_work!' do
    it 'student take to work a homework' do
      expect(student.to_work!(homework)).to eql [homework]
    end
  end

  describe '#add_answer!' do
    it 'array of answers for homework is empty' do
      expect(homework.answers).to eql []
    end

    it 'student make answer for homework' do
      student.add_answer!(homework, 'new students answer')
      expect(homework.answers).to eql ['new students answer']
    end
  end

  describe '#to_check!' do
    it 'student sent to check homework and mentor get notification' do
      expect(student.to_check!(homework).last).to be_a(Notification)
    end
  end
end

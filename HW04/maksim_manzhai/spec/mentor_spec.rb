# frozen_string_literal: true

require 'mentor'
require 'student'
require 'homework'
require 'notification'

RSpec.describe Mentor do
  subject { described_class.new(name: 'Will', surname: 'Smith') }

  let(:student) { Student.new(name: 'Chris', surname: 'Rock') }
  let(:notification) { Notification.new(title: 'HW03', description: 'OOP in Ruby') }
  let(:homework) { Homework.new(title: 'HW03', description: 'OOP in Ruby', student: student, mentor: subject) }

  describe '#add_homework' do
    it 'returns an object of class Homework' do
      expect(subject.add_homework(title: 'HW03', description: 'OOP in Ruby', student: student)).to be_a(Homework)
    end
  end

  describe '#mark_as_read!' do
    let(:notification) { Notification.new(title: homework.title, description: 'Homework started') }

    it 'sees empty array of notifications' do
      expect(subject.notifications).to eq([])
    end

    it 'gets notification' do
      expect { subject.notifications << notification }.to(change { subject.notifications.size })
    end

    it 'marks as read all notifications' do
      subject.notifications << notification
      expect { subject.mark_as_read! }.to(change { subject.notifications[0].readed }.to(true))
    end
  end

  describe '#reject_to_work!' do
    it 'rejects homework and student gets notification' do
      expect(subject.reject_to_work!(homework).last).to be_a(Notification)
    end
  end

  describe '#accept!' do
    it 'accepts homework' do
      expect(subject.accept!(homework).last).to be_a(Notification)
    end

    it 'makes status of homework acceptable' do
      expect(instance_double('homework', acceptable: true).acceptable).to be true
    end
  end
end

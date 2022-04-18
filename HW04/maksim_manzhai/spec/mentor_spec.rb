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
    before { subject.add_homework(title: 'HW03', description: 'OOP in Ruby', student: student) }

    it 'returns an object of class Homework' do
      expect(homework).to be_a(Homework)
    end

    it 'student gets notification about new homework' do
      expect(student.notifications[0]).to be_a(Notification)
    end
  end

  describe '#mark_as_read!' do
    let(:notification) { Notification.new(title: homework.title, description: 'Homework started') }

    before { subject.notifications << notification }

    it 'gets notification' do
      expect(subject.notifications.size).to eq(1)
    end

    it 'marks as read all notifications' do
      expect { subject.mark_as_read! }.to(change { subject.notifications[0].readed }.from(false).to(true))
    end
  end

  describe '#reject_to_work!' do
    it 'rejects homework and student gets notification' do
      expect(subject.reject_to_work!(homework).last).to be_a(Notification)
    end
  end

  describe '#accept!' do
    it 'returns notification about acception of homework' do
      expect(subject.accept!(homework).last).to be_a(Notification)
    end

    it 'makes status of homework acceptable' do
      expect(instance_double('homework', acceptable: true).acceptable).to be true
    end
  end
end

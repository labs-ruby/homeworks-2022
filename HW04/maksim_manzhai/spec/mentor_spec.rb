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
      expect(homework).to be_a(Homework)
    end

    it 'sends notification to student about new homework' do
      expect { subject.add_homework(title: 'HW03', description: 'OOP in Ruby', student: student) }.to change { student.notifications.size }.from(0).to(1)
    end
  end

  describe '#mark_as_read!' do
    let(:notification) { Notification.new(title: homework.title, description: 'Homework started') }

    context 'when mentor gets notification' do
      it 'increases number of notifications' do
        expect { subject.notifications << notification }.to change { subject.notifications.size }.from(0).to(1)
      end
    end

    context 'when mentor marks as read all notifications' do
      before { subject.notifications << notification }

      it 'marks all notifications as read' do
        expect { subject.mark_as_read! }.to change { subject.notifications.last.readed }.from(false).to(true)
      end
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
      expect { subject.accept!(homework) }.to change(homework, :acceptable).from(false).to(true)
    end
  end
end

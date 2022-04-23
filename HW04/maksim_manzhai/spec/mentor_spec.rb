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

    it 'sends notification to student about new homework' do
      expect { subject.add_homework(title: 'HW03', description: 'OOP in Ruby', student: student) }.to change { student.notifications.size }.from(0).to(1)
    end
  end

  describe '#mark_as_read!' do
    let(:notification) { Notification.new(title: homework.title, description: 'Homework started') }

    context 'when mentor marks as read all notifications' do
      before { subject.notifications << notification }

      it 'marks all notifications as read' do
        expect { subject.mark_as_read! }.to change { subject.notifications.last.readed }.from(false).to(true)
      end
    end
  end

  describe '#reject_to_work!' do
    it 'sends notification to student about reject homework' do
      expect { subject.reject_to_work!(homework) }.to change { student.notifications.size }.from(0).to(1)
    end
  end

  describe '#accept!' do
    it 'sends notification to student about accept homework' do
      expect { subject.accept!(homework) }.to change { student.notifications.size }.from(0).to(1)
    end

    it 'makes status of homework acceptable' do
      expect { subject.accept!(homework) }.to change(homework, :acceptable).from(false).to(true)
    end
  end
end

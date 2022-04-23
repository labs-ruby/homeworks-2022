# frozen_string_literal: true

require 'student'
require 'notification'
require 'mentor'
require 'homework'

RSpec.describe Student do
  subject { described_class.new(name: 'Chris', surname: 'Rock') }

  let(:mentor) { Mentor.new(name: 'Will', surname: 'Smith') }
  let(:notification) { Notification.new(title: 'HW03', description: 'OOP in Ruby') }
  let(:homework) { Homework.new(title: 'HW03', description: 'OOP in Ruby', student: subject, mentor: mentor) }

  describe '#mark_as_read!' do
    context 'when student marks as read all notifications' do
      before { subject.notifications << notification }

      it 'marks as read all notifications' do
        expect { subject.mark_as_read! }.to change { subject.notifications.last.readed }.from(false).to(true)
      end
    end
  end

  describe '#to_work!' do
    context 'when there is no homeworks' do
      it 'returns an empty array' do
        expect(subject.homeworks).to eql []
      end
    end

    context 'when student gets homework' do
      it 'sends notification to mentor' do
        expect { subject.to_work!(homework) }.to change { mentor.notifications.size }.from(0).to(1)
      end

      it 'increases number of homeworks' do
        expect { subject.to_work!(homework) }.to change { subject.homeworks.size }.from(0).to(1)
      end
    end
  end

  describe '#add_answer!' do
    it 'increases number of answers to homework' do
      expect { subject.add_answer!(homework, 'new students answer') }.to change { homework.answers.size }.from(0).to(1)
    end
  end

  describe '#to_check!' do
    it 'sends notification to mentor' do
      expect { subject.to_check!(homework) }.to change { mentor.notifications.size }.from(0).to(1)
    end
  end
end

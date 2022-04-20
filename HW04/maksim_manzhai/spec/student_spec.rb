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

  context 'when student see notification' do
    before { subject.notifications << notification }

    it 'gets notification' do
      expect(subject.notifications.size).to eq(1)
    end

    it 'marks as read all notifications' do
      expect { subject.mark_as_read! }.to(change { subject.notifications.last.readed }.from(false).to(true))
    end
  end

  context 'when student see empty array of homeworks' do
    it 'returns an empty array' do
      expect(subject.homeworks).to eql []
    end
  end

  context 'when student see array with homeworks' do
    before { subject.homeworks << homework }

    it 'returns array with homework' do
      expect(subject.homeworks).to eql [homework]
    end
  end

  describe '#to_work!' do
    it 'takes to work a homework' do
      expect(subject.to_work!(homework)).to eql [homework]
    end
  end

  describe '#add_answer!' do
    it 'makes answer for homework' do
      expect { subject.add_answer!(homework, 'new students answer') }.to(change { homework.answers.size })
    end
  end

  describe '#to_check!' do
    it 'sents to check homework and mentor get notification' do
      expect(subject.to_check!(homework).last).to be_a(Notification)
    end
  end
end

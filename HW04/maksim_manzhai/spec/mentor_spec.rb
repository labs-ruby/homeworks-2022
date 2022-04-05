# frozen_string_literal: true

require 'mentor'
require 'student'
require 'homework'
require 'notification'

RSpec.describe Mentor do
  let(:mentor) { described_class.new(name: 'Will', surname: 'Smith') }
  let(:student) { Student.new(name: 'Chris', surname: 'Rock') }

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

  describe '#subscribe_to!' do
    it 'returns list of mentor subscriptions' do
      mentor.subscribe_to!(student)
      expect(mentor.subscriptions).to eql [student]
    end
  end
end

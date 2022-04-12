# frozen_string_literal: true

require_relative '../lib/student'
require_relative '../lib/mentor'
require_relative '../lib/homework'
require_relative '../lib/notification'

RSpec.describe Student do
  let(:student) { described_class.new(name: 'students_name', surname: 'students_surname') }
  let(:mentor) { Mentor.new(name: 'mentor_name', surname: 'mentor_surname') }
  let(:homework) { Homework.new(title: 'title', description: 'description', student: student, mentor: mentor) }

  describe '#to_work!' do
    it 'notifies mentor' do
      student.to_work!(homework)
      expect(mentor.notes.empty?).to eq false
    end
  end

  describe '#to_check!' do
    it 'changes status of homework' do
      student.to_check!(homework)
      expect(homework.status).to eq 'to check'
    end

    it 'notifies mentor' do
      student.to_check!(homework)
      expect(mentor.notes.empty?).to eq false
    end
  end

  describe '#add_answer!' do
    it 'changes answer of homework' do
      student.add_answer!(homework, 'answer')
      expect(homework.answer).to eq 'answer'
    end
  end
end

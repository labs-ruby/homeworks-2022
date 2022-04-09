# frozen_string_literal: true

require_relative '../lib/student'
require_relative '../lib/mentor'
require_relative '../lib/homework'
require_relative '../lib/notification'

RSpec.describe Mentor do
  let(:student) { Student.new(name: 'students_name', surname: 'students_surname') }
  let(:mentor) { described_class.new(name: 'mentor_name', surname: 'mentor_surname') }
  let(:hw) { Homework.new(title: 'title', description: 'description', student: student, mentor: mentor) }

  context 'when created' do
    it 'returns correct name' do
      expect(mentor.name).to eq 'mentor_name'
    end

    it 'returns correct surname' do
      expect(mentor.surname).to eq 'mentor_surname'
    end
  end

  context 'when subscribed to student' do
    it 'student added' do
      mentor.subscribe_to!(student)
      expect(mentor.students.empty?).to eq false
    end
  end

  describe '#add_homework!' do
    it 'returs Homework object' do
      homework = mentor.add_homework(title: 'title', description: 'description', student: student)
      expect(homework).to be_a Homework
    end
  end

  describe '#reject_to_work!' do
    it 'changes status of homework to rejected' do
      mentor.reject_to_work!(hw)
      expect(hw.status).to eq 'rejected'
    end

    it 'notify student' do
      mentor.reject_to_work!(hw)
      expect(student.notes.empty?).to eq false
    end
  end

  describe '#accept!' do
    it 'changes status of homework to accepted' do
      mentor.accept!(hw)
      expect(hw.status).to eq 'accepted'
    end

    it 'notify student' do
      mentor.accept!(hw)
      expcet(student.notes.empty?).to eq false
    end
  end
end

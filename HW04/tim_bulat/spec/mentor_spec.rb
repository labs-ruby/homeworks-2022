# frozen_string_literal: true

require_relative '../lib/student'
require_relative '../lib/mentor'
require_relative '../lib/homework'
require_relative '../lib/notification'

RSpec.describe Mentor do
  let(:student) { Student.new(name: 'students_name', surname: 'students_surname') }
  let(:mentor) { described_class.new(name: 'mentor_name', surname: 'mentor_surname') }
  let(:homework) { Homework.new(title: 'title', description: 'description', student: student, mentor: mentor) }

  context 'when subscribed to student' do
    it 'add student to mentors list' do
      mentor.subscribe_to!(student)
      expect(mentor.students).not_to be_empty
    end
  end

  describe '#add_homework!' do
    it 'returs Homework object' do
      expect( mentor.add_homework(title: 'title', description: 'description', student: student)).to be_a Homework
    end
  end

  describe '#reject_to_work!' do
    it 'changes status of homework to rejected' do
      mentor.reject_to_work!(homework)
      expect(homework.status).to eq 'rejected'
    end

    it 'notify student' do
      mentor.reject_to_work!(homework)
      expect(student.notes).not_to be_empty
    end
  end

  describe '#accept!' do
    it 'changes status of homework to accepted' do
      mentor.accept!(homework)
      expect(homework.status).to eq 'accepted'
    end

    it 'notify student' do
      mentor.accept!(homework)
      expect(student.notes).not_to be_empty
    end
  end
end

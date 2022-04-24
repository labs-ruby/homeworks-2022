# frozen_string_literal: true

require_relative '../lib/student'

RSpec.describe Student do
  student { described_class.new(name: 'Hanna', surname: 'Zhurauskaya') }

  describe '#name' do
    it 'student has name' do
      expect(student.name).to eq('Hanna')
    end
  end

  describe '#surname' do
    it 'student has surname' do
      expect(student.surname).to eq('Zhurauskaya')
    end
  end

  describe '#full_name' do
    student { described_class.new(name: 'Hanna', surname: 'Zhurauskaya') }.full_name
    it 'student has fullname' do
      expected_student = 'Hanna Zhurauskaya'
      expect(student).to eq expected_student
    end
  end
end

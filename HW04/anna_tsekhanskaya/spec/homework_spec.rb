# frozen_string_literal: true

require_relative '/home/hanna/training/homeworks-2022/HW04/anna_tsekhanskaya/lib/homework'
require_relative '/home/hanna/training/homeworks-2022/HW04/anna_tsekhanskaya/lib/student'

RSpec.describe Homework do
  let(:student) { Student.new(name: 'Hanna', surname: 'Zhurauskaya') }
  homework { described_class.new(title: 'HW05', description: 'Description homework', student: student) }

  describe '#title' do
    it 'Homework has title' do
      expect(homework.title).to eq('HW05')
    end
  end

  describe '#description' do
    it 'Homework has description' do
      expect(homework.description).to eq('Description homework')
    end
  end
end

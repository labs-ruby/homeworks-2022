# frozen_string_literal: true

RSpec.describe Homework do
  subject { described_class.new(title: 'title', description: 'fake', student: student) }

  let(:student) { Student.new(name: 'Petr', surname: 'Petrov') }

  describe '#title' do
    it 'homework has title' do
      expect(subject.title).to eq('title')
    end
  end

  describe '#description' do
    it 'homework has description' do
      expect(subject.description).to eq('fake')
    end
  end

  describe '#student' do
    it 'homework has student' do
      expect(subject.student).to eq(student)
    end
  end

  describe '#state' do
    it 'homework has state Created' do
      expect(subject.state).to eq('Created')
    end
  end

  describe '#add_homework_file' do
    let(:homework) { described_class.new(title: 'title', description: 'fake', student: student) }
    let(:homework_data) { 'data' }

    before do
      allow(homework).to receive(:add_data)
    end

    it 'call #add_data' do
      homework.add_homework_file
      expect(homework).to have_received(:add_data)
    end
  end

  describe '#to_work!' do
    let(:homework) { described_class.new(title: 'title', description: 'fake', student: student) }

    before do
      allow(homework).to receive_messages(update_state_in_file: 'foo', notify_mentors: 'bar')
    end

    it 'state = In work ' do
      homework.to_work!
      expect(homework.state).to eq('In work')
    end
  end

  describe '#to_check!' do
    let(:homework) { described_class.new(title: 'title', description: 'fake', student: student) }

    before do
      allow(homework).to receive_messages(update_state_in_file: 'foo', notify_mentors: 'bar')
    end

    it 'state = Pending rewiev' do
      homework.to_check!
      expect(homework.state).to eq('Pending rewiev')
    end
  end

  describe '#reject!' do
    let(:homework) { described_class.new(title: 'title', description: 'fake', student: student) }
    let(:mentor) { 'mentor' }
    let(:remarks) { 'remarks' }

    before do
      allow(homework).to receive_messages(update_state_in_file: 'foo', notify_students: 'bar', add_remarks: 'baz')
    end

    it 'state = Rejected' do
      homework.reject!(mentor, remarks)
      expect(homework.state).to eq('Rejected')
    end
  end

  describe '#accept!' do
    let(:homework) { described_class.new(title: 'title', description: 'fake', student: student) }
    let(:grade) { 5 }

    before do
      allow(homework).to receive_messages(update_state_in_file: 'foo', notify_students: 'bar', add_grade: 'baz')
    end

    it 'state = Passed' do
      homework.accept!(grade)
      expect(homework.state).to eq('Passed')
    end
  end

  describe '#add_answer' do
    let(:homework) { described_class.new(title: 'title', description: 'fake', student: student) }
    let(:answer) { 'answer' }

    before do
      allow(homework).to receive(:add_data)
    end

    it 'call #add_data' do
      homework.add_answer!(answer)
      expect(homework).to have_received(:add_data)
    end
  end
end

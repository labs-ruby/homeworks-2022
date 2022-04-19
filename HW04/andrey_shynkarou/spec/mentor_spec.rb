# frozen_string_literal: true

require_relative '../lib/mentor'
require_relative '../lib/student'
require_relative '../lib/file_support'
require_relative '../lib/homework'

RSpec.describe Mentor do
  subject(:mentor) { described_class.new(name: name, surname: surname) }

  let(:name) { 'And' }
  let(:surname) { 'Abc' }

  describe '#notifications' do
    context 'when file exist' do
      let(:filename) { 'notification.txt' }
      let(:file) { File.new("#{File.dirname(__FILE__)}/notification.txt") }

      it 'read filename and put text' do
        allow(File).to receive(:open).with(filename, 'r').and_return(file)
        expect { mentor.notifications }.to output.to_stdout
      end
    end
  end

  describe '#add_homework' do
    let(:student) { Student.new(name: 'John', surname: 'Doe') }

    context 'when filename exist' do
      let(:message) { "add_homeworkHW03, descriptionfor #{student.name} #{student.surname}.\n" }
      let(:file) { File.new("#{File.dirname(__FILE__)}/homework.txt") }

      it 'add homework to homework_file' do
        allow(File).to receive(:open).with('homework.txt', 'w').and_return(file)
        allow(file).to receive(:write).with(message)
        expect(File.read("#{File.dirname(__FILE__)}/homework.txt")).to eq(message)
      end

      it 'add homework contain a homework.object' do
        allow(File).to receive(:open).with('homework.txt', 'w').and_return(file)
        allow(file).to receive(:write).with(message)
        expect(mentor.add_homework(title: 'HW03', description: 'description', student: student)).to be_a Homework
      end
    end
  end

  describe '#mark_as_read!' do
    context 'when filename exist' do
      let(:file) { File.new("#{File.dirname(__FILE__)}/notification.txt") }
      let(:message) { '' }

      it 'make notification_file empty' do
        allow(File).to receive(:open).with('notification.txt', 'w').and_return(file)
        allow(file).to receive(:write).with(message)
        expect(File.read("#{File.dirname(__FILE__)}/notification.txt")).to eq('')
      end
    end
  end

  describe '#accept!' do
    context 'when filename exist' do
      let(:file) { File.new("#{File.dirname(__FILE__)}/notification.txt") }
      let(:message) { "Homework HW03 description homework is accepted.\n" }

      it 'make notification accept' do
        allow(File).to receive(:open).with('notification.txt', 'w').and_return(file)
        allow(file).to receive(:write).with(message)
        expect(File.read("#{File.dirname(__FILE__)}/notification.txt")).to eq(message)
      end
    end
  end

  describe '#reject_to_work!' do
    context 'when filename exist' do
      let(:file) { File.new("#{File.dirname(__FILE__)}/notification.txt") }
      let(:message) { "Answer for  HW03 description homework is rejected.\n" }

      it 'make notification accept' do
        allow(File).to receive(:open).with('notification.txt', 'w').and_return(file)
        allow(file).to receive(:write).with(message)
        expect(File.read("#{File.dirname(__FILE__)}/notification.txt")).to eq(message)
      end
    end
  end

  describe '#subscribe_to!' do
    context 'when filename exist' do
      let(:student) { Student.new(name: 'John', surname: 'Doe') }
      let(:file) { File.new("#{File.dirname(__FILE__)}/notification.txt") }
      let(:message) { "Mentor #{name} #{surname} is subscribed to #{student.name} #{student.surname}.\n" }

      it 'make notification accept' do
        allow(File).to receive(:open).with('notification.txt', 'w').and_return(file)
        allow(file).to receive(:write).with(message)
        expect(File.read("#{File.dirname(__FILE__)}/notification.txt")).to eq(message)
      end
    end
  end
end

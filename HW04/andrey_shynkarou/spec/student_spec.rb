# frozen_string_literal: true

require_relative '../lib/student'
require_relative '../lib/file_support'
require_relative '../lib/homework'

RSpec.describe Student do
  subject(:student) { described_class.new(name: name, surname: surname) }

  let(:name) { 'John' }
  let(:surname) { 'Doe' }
  let(:homework) { Homework.new(title: 'HW03', description: 'description homework', student: student) }

  describe '#notifications' do
    context 'when file exist' do
      let(:filename) { 'notification.txt' }
      let(:file) { File.new("#{File.dirname(__FILE__)}/notification.txt") }

      it 'read filename and put text' do
        allow(File).to receive(:open).with(filename, 'r').and_return(file)
        expect { student.notifications }.to output.to_stdout
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

  describe '#homeworks' do
    context 'when filename exist' do
      let(:filename) { 'homework.txt' }
      let(:file) { File.new("#{File.dirname(__FILE__)}/homework.txt") }

      it 'read filename and put text' do
        allow(File).to receive(:open).with(filename, 'r').and_return(file)
        expect { student.homeworks }.to output.to_stdout
      end
    end
  end

  describe '#to_work!' do
    context 'when filename exist' do
      let(:file) { File.new("#{File.dirname(__FILE__)}/notification.txt") }
      let(:message) { "#{name} #{surname} left message #{homework.title} is doing.\n" }

      it 'make notification accept' do
        allow(File).to receive(:open).with('notification.txt', 'w').and_return(file)
        allow(file).to receive(:write).with(message)
        expect(File.read("#{File.dirname(__FILE__)}/notification.txt")).to eq(message)
      end
    end
  end

  describe '#add_answer!' do
    context 'when filename exist' do
      let(:file) { File.new("#{File.dirname(__FILE__)}/notification.txt") }
      let(:message) { "#{name} #{surname} was solved for #{homework.title}. Answer is new students answer.\n" }

      it 'make notification accept' do
        allow(File).to receive(:open).with('notification.txt', 'w').and_return(file)
        allow(file).to receive(:write).with(message)
        expect(File.read("#{File.dirname(__FILE__)}/notification.txt")).to eq(message)
      end
    end
  end

  describe '#to_check!' do
    context 'when filename exist' do
      let(:file) { File.new("#{File.dirname(__FILE__)}/notification.txt") }
      let(:message) { "#{name} #{surname} left message #{homework.title} needs to check.\n" }

      it 'make notification accept' do
        allow(File).to receive(:open).with('notification.txt', 'w').and_return(file)
        allow(file).to receive(:write).with(message)
        expect(File.read("#{File.dirname(__FILE__)}/notification.txt")).to eq(message)
      end
    end
  end
end

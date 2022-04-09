require_relative '../lib/mentor'

RSpec.describe Mentor do
  describe '#notifications' do
    subject { described_class.new(name, surname) }
    context 'when filename exist' do
      let(:name) { 'Andrey' }
      let(:surname) { 'Abc' }
      let(:filename) { 'notification_test.txt' }
      let(:file) { File.new("#{_FILE_}/notification_test.txt") }

      it 'should read filename and put text' do
        

        allow(File).to receive(:open).with("filename", "r").and_return(file)

      end
    end

  end
end
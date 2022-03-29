require_relative 'spec_helper'

RSpec.describe Student do
  subject { described_class.new(name: 'Siarhei', surname: 'Pratasevich') }

  let(:homework) { Homework.new(title: 'HW03', description: '5!(factorial). Using method reduce', student: subject) }
  let(:last_notifications_file_line) { File.readlines('Siarhei_Pratasevich_notifications.txt').last(2).join }
  let(:notifications_file_content) { File.read('Siarhei_Pratasevich_notifications.txt') }
  let(:notifications_file_exist) { File.file? 'Siarhei_Pratasevich_notifications.txt' }

  describe '#notifications' do
    context 'when the notifications file do not exist' do
      subject { described_class.new(name: 'Siarhei', surname: 'Pratasevich').notifications }

      it 'gets error "No such file or directory"' do
        expect { subject }.to raise_error(Errno::ENOENT)
      end
    end

    context 'when the notifications file exist' do
      subject { described_class.new(name: 'Siarhei', surname: 'Pratasevich').notifications }

      let!(:add_notification_file) do
        File.open('Siarhei_Pratasevich_notifications.txt', 'a') do |f|
          f.write("#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} New homework\n")
          f.close
        end
      end

      let(:right_output) do
        "#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} New homework\n"
      end

      after(:each) do
        File.delete('Siarhei_Pratasevich_notifications.txt')
      end

      it 'notifications method should to returns object of nil class' do
        expect(subject).to be_kind_of(NilClass)
      end

      it 'outputs notifications in console should to be equivalent all lines notifications file' do
        expect { subject }.to output(right_output).to_stdout
      end
    end
  end
end

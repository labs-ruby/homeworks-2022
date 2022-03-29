# frozen_string_literal: true

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

      before do
        File.open('Siarhei_Pratasevich_notifications.txt', 'a') do |f|
          f.write("#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} New homework\n")
          f.close
        end
      end

      let(:right_output) do
        "#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} New homework\n"
      end

      after do
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

  describe '#mark_as_read!' do
    let(:method_notification) do
      "#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} Read all notifications (Siarhei Pratasevich)\n".cyan
    end

    after do
      File.delete('Siarhei_Pratasevich_notifications.txt')
    end

    context 'when the notifications file do not exist' do
      before { subject.mark_as_read! }

      it '"mark_as_read!" method should to creates notifications file' do
        expect(notifications_file_exist).to be_truthy
      end

      it 'notification file content to be equivalent method "mark_as_read!" notification' do
        expect(notifications_file_content).to eq(method_notification)
      end
    end

    context 'when the notifications file exist' do
      context 'when the notifications file is empty' do
        before do
          File.open('Siarhei_Pratasevich_notifications.txt', 'w', &:close)
          subject.mark_as_read!
        end

        it 'append "mark_as_read!" method notification to empty notifications file (notification file content to be equivalent method notification)' do
          expect(notifications_file_content).to eq(method_notification)
        end
      end

      context 'when the notifications file is not empty' do
        before do
          File.open('Siarhei_Pratasevich_notifications.txt', 'w') do |f|
            f.write("New homework\n")
            f.close
          end
          subject.mark_as_read!
        end

        it 'appends new notification to notifications file (last file line to be equivalent method "mark_as_read!" notification)' do
          expect(last_notifications_file_line).to eq(method_notification)
        end

        it 'Last notifications file line not to be equivalent all notifications file' do
          expect(last_notifications_file_line).not_to eq(notifications_file_content)
        end
      end
    end
  end

  describe '#to_work!' do
    let(:method_notification) do
      "#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} Taked to work HW03 \"5!(factorial). Using method reduce\" (Siarhei Pratasevich)\n".cyan
    end

    after do
      File.delete('Siarhei_Pratasevich_notifications.txt')
    end

    context 'when the notifications file do not exist' do
      before { subject.to_work!(homework) }

      it '"to_work!" method should to creates notifications file' do
        expect(notifications_file_exist).to be_truthy
      end

      it 'notifications file content to be equivalent method "to_work!" notification' do
        expect(notifications_file_content).to eq(method_notification)
      end
    end

    context 'when the notifications file exist' do
      context 'when the notifications file is empty' do
        before do
          File.open('Siarhei_Pratasevich_notifications.txt', 'w', &:close)
          subject.to_work!(homework)
        end

        it 'append "to_work!" method notification to empty notifications file (notification file content to be equivalent method notification)' do
          expect(notifications_file_content).to eq(method_notification)
        end
      end

      context 'when the notifications file is not empty' do
        before do
          File.open('Siarhei_Pratasevich_notifications.txt', 'w') do |f|
            f.write("New homework\n")
            f.close
          end
          subject.to_work!(homework)
        end

        it 'appends new notification to notifications file (last file line to be equivalent method "to_work!" notification)' do
          expect(last_notifications_file_line).to eq(method_notification)
        end

        it 'Last notifications file line not to be equivalent all notifications file' do
          expect(last_notifications_file_line).not_to eq(notifications_file_content)
        end
      end
    end
  end

  describe '#homeworks' do
    context 'when the homeworks file do not exist' do
      subject { described_class.new(name: 'Siarhei', surname: 'Pratasevich').homeworks }

      it 'gets error "No such file or directory"' do
        expect { subject }.to raise_error(Errno::ENOENT)
      end
    end

    context 'when the homeworks file exist' do
      subject { described_class.new(name: 'Siarhei', surname: 'Pratasevich').homeworks }

      before do
        File.open('Siarhei_Pratasevich_homework.txt', 'w') do |f|
          f.write("#{Time.new
            .strftime('%d-%m-%Y %H:%M:%S')} homework: HW03 \"5!(factorial). Using method reduce\" for Siarhei Pratasevich\n")
          f.close
        end
      end

      let(:right_output) do
        "#{Time.new
        .strftime('%d-%m-%Y %H:%M:%S')} homework: HW03 \"5!(factorial). Using method reduce\" for Siarhei Pratasevich\n"
      end

      after do
        File.delete('Siarhei_Pratasevich_homework.txt')
      end

      it 'homeworks method should to returns object of nil class' do
        expect(subject).to be_kind_of(NilClass)
      end

      it 'output notification in console should to be equivalent homework title and description' do
        expect { subject }.to output(right_output).to_stdout
      end
    end
  end

  describe '#add_answer!' do
    let(:answer_file_content) { File.read('Siarhei_Pratasevich_answer.txt') }

    after do
      File.delete('Siarhei_Pratasevich_answer.txt')
    end

    context 'when the answer file do not exist' do
      let(:answer_01) { '(1..5).to_a.reduce(:+)' }
      let(:full_homework_answer_01) do
        "#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} Answer HW03 \"5!(factorial). Using method reduce\" => (1..5).to_a.reduce(:+)\n"
      end
      let(:answer_file_exist) { File.file? 'Siarhei_Pratasevich_answer.txt' }

      before { subject.add_answer!(homework, answer_01) }

      it '"add_answer!" method should creates answer file' do
        expect(answer_file_exist).to be_truthy
      end

      it 'answer file content to be equivalent homework answer' do
        expect(answer_file_content).to eq(full_homework_answer_01)
      end
    end

    context 'when the answer file exist' do
      before do
        File.open('Siarhei_Pratasevich_answer.txt', 'w') do |f|
          f.write("#{Time.new
            .strftime('%d-%m-%Y %H:%M:%S')} Answer HW03 => (1..5).to_a.reduce(:+)\n)")
          f.close
        end
        subject.add_answer!(homework, answer_02)
      end

      let(:answer_02) { '(1..5).to_a.reduce(:*)' }
      let(:full_homework_answer_02) do
        "#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} Answer HW03 \"5!(factorial). Using method reduce\" => (1..5).to_a.reduce(:*)\n"
      end

      it 'toes overwrites previous answer file to file with new answer' do
        expect(answer_file_content).to eq(full_homework_answer_02)
      end
    end
  end

  describe '#to_check!' do
    let(:method_notification) do
      "#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} Sent to check HW03 \"5!(factorial). Using method reduce\" (Siarhei Pratasevich)\n".cyan
    end

    after do
      File.delete('Siarhei_Pratasevich_notifications.txt')
    end

    context 'when the notifications file do not exist' do
      before { subject.to_check!(homework) }

      it '"to_check!" method should to creates notifications file' do
        expect(notifications_file_exist).to be_truthy
      end

      it 'notifications file content to be equivalent "to_check!" method notification' do
        expect(notifications_file_content).to eq(method_notification)
      end
    end

    context 'when the notifications file exist' do
      context 'when the notifications file is empty' do
        before do
          File.open('Siarhei_Pratasevich_notifications.txt', 'w', &:close)
          subject.to_check!(homework)
        end

        it 'append "to_check!" method notification to empty notifications file (notification file content to be equivalent method notification)' do
          expect(notifications_file_content).to eq(method_notification)
        end
      end

      context 'when the notifications file is not empty' do
        before do
          File.open('Siarhei_Pratasevich_notifications.txt', 'w') do |f|
            f.write("New homework\n")
            f.close
          end
          subject.to_check!(homework)
        end

        it 'appends new notification to notifications file (last file line to be equivalent method "to_check!" notification)' do
          expect(last_notifications_file_line).to eq(method_notification)
        end

        it 'Last notifications file line not to be equivalent all notifications file' do
          expect(last_notifications_file_line).not_to eq(notifications_file_content)
        end
      end
    end
  end
end

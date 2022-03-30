# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Mentor do
  subject { described_class.new(name: 'Jack', surname: 'Gonsales') }

  let(:student) { Student.new(name: 'Siarhei', surname: 'Pratasevich') }
  let(:notifications_file_content) { File.read('Siarhei_Pratasevich_notifications.txt') }

  describe '#add_homework' do
    subject do
      described_class.new(name: 'Jack', surname: 'Gonsales')
                     .add_homework(title: 'HW03', description: '5!(factorial). Using method reduce', student: student)
    end

    let(:homework_file_content) { File.read('Siarhei_Pratasevich_homework.txt') }
    let(:notification_for_notifications_file) do
      "#{Time.new
      .strftime('%d-%m-%Y %H:%M:%S')} New homework: HW03 \"5!(factorial). Using method reduce\" for Siarhei Pratasevich\n"
    end
    let(:notification_for_homework_file) do
      "#{Time.new
      .strftime('%d-%m-%Y %H:%M:%S')} homework: HW03 \"5!(factorial). Using method reduce\" for Siarhei Pratasevich\n"
    end

    context 'when notifications and homework files do not exist' do
      before { subject }

      after do
        File.delete('Siarhei_Pratasevich_notifications.txt')
        File.delete('Siarhei_Pratasevich_homework.txt')
      end

      it 'method should to returns object Homework class' do
        expect(subject).to be_kind_of(Homework)
      end

      it 'homework file content should to be equivalent homework title and description' do
        expect(homework_file_content).to eq(notification_for_homework_file)
      end

      it 'notifications file content should to be equivalent new homework title and description' do
        expect(notifications_file_content).to eq(notification_for_notifications_file)
      end
    end

    context 'when notifications and homework files exist' do
      before do
        File.open('Siarhei_Pratasevich_notifications.txt', 'w') do |f|
          f.write("New homework\n")
          f.close
        end
        File.open('Siarhei_Pratasevich_homework.txt', 'w') do |f|
          f.write("New homework\n")
          f.close
        end
        subject
      end

      after do
        File.delete('Siarhei_Pratasevich_notifications.txt')
        File.delete('Siarhei_Pratasevich_homework.txt')
      end

      it 'method should to returns object Homework class' do
        expect(subject).to be_kind_of(Homework)
      end

      it 'overwrite old homework file content to new homework title and description' do
        expect(homework_file_content).to eq(notification_for_homework_file)
      end

      it 'overwrite old notifications file content to new homework title and description' do
        expect(notifications_file_content).to eq(notification_for_notifications_file)
      end
    end
  end

  describe '#notifications' do
    subject { described_class.new(name: 'Jack', surname: 'Gonsales').notifications(student) }

    context 'when the notifications file do not exist' do
      it 'gets error "No such file or directory"' do
        expect { subject }.to raise_error(Errno::ENOENT)
      end
    end

    context 'when the notifications file exist' do
      let(:right_output) do
        "#{Time.new
        .strftime('%d-%m-%Y %H:%M:%S')} New homework: HW03\n#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} New homework: HW04\n"
      end

      before do
        File.open('Siarhei_Pratasevich_notifications.txt', 'w') do |f|
          f.write("#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} New homework: HW03\n")
          f.write("#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} New homework: HW04\n")
          f.close
        end
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
      "#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} Read all notifications (Jack Gonsales)\n".yellow
    end

    after do
      File.delete('Siarhei_Pratasevich_notifications.txt')
    end

    context 'when the file notification do not exist' do
      let(:notifications_file_exist) { File.file? 'Siarhei_Pratasevich_notifications.txt' }

      before { subject.mark_as_read!(student) }

      it '"mark_as_read!" method should to creates notifications file' do
        expect(notifications_file_exist).to be_truthy
      end

      it 'notifications file content to be equivalent "mark_as_read!" method notification' do
        expect(notifications_file_content).to eq(method_notification)
      end
    end

    context 'when the notifications file exist' do
      context 'when the notifications file is empty' do
        before do
          File.open('Siarhei_Pratasevich_notifications.txt', 'w', &:close)
          subject.mark_as_read!(student)
        end

        it 'append "mark_as_read!" method notification to empty notifications file (notification file content to be equivalent method notification)' do
          expect(notifications_file_content).to eq(method_notification)
        end
      end

      context 'when the notifications file is not empty' do
        let(:last_notifications_file_line) { File.readlines('Siarhei_Pratasevich_notifications.txt').last(2).join }

        before do
          File.open('Siarhei_Pratasevich_notifications.txt', 'w') do |f|
            f.write("New homework\n")
            f.close
          end
          subject.mark_as_read!(student)
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

  describe '#subscribe_to!' do
    let(:method_notification) do
      "#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} Jack Gonsales subscribe to Siarhei_Pratasevich\n".yellow
    end

    after do
      File.delete('Siarhei_Pratasevich_notifications.txt')
    end

    context 'when the file notification do not exist' do
      let(:notifications_file_exist) { File.file? 'Siarhei_Pratasevich_notifications.txt' }

      before { subject.subscribe_to!(student) }

      it '"subscribe_to!" method should to creates notifications file' do
        expect(notifications_file_exist).to be_truthy
      end

      it 'notifications file content to be equivalent "subscribe_to!" method notification' do
        expect(notifications_file_content).to eq(method_notification)
      end
    end

    context 'when the notifications file exist' do
      context 'when the notifications file is empty' do
        before do
          File.open('Siarhei_Pratasevich_notifications.txt', 'w', &:close)
          subject.subscribe_to!(student)
        end

        it 'append "subscribe_to!" method notification to empty notifications file (notification file content to be equivalent method notification)' do
          expect(notifications_file_content).to eq(method_notification)
        end
      end

      context 'when the notifications file is not empty' do
        let(:last_notifications_file_line) { File.readlines('Siarhei_Pratasevich_notifications.txt').last(2).join }

        before do
          File.open('Siarhei_Pratasevich_notifications.txt', 'w') do |f|
            f.write("New homework\n")
            f.close
          end
          subject.subscribe_to!(student)
        end

        it 'appends new notification to notifications file (last file line to be equivalent method "subscribe_to!" notification)' do
          expect(last_notifications_file_line).to eq(method_notification)
        end

        it 'Last notifications file line not to be equivalent all notifications file' do
          expect(last_notifications_file_line).not_to eq(notifications_file_content)
        end
      end
    end
  end

  describe '#reject_to_work!' do
    let(:homework) { Homework.new(title: 'HW03', description: '5!(factorial). Using method reduce', student: student) }
    let(:method_notification) do
      "#{Time.new
      .strftime('%d-%m-%Y %H:%M:%S')} Wrong answer for HW03 \"5!(factorial). Using method reduce\" (Jack Gonsales)\n".yellow
    end

    after do
      File.delete('Siarhei_Pratasevich_notifications.txt')
    end

    context 'when the file notification do not exist' do
      let(:notifications_file_exist) { File.file? 'Siarhei_Pratasevich_notifications.txt' }

      before { subject.reject_to_work!(homework, student) }

      it '"reject_to_work!" method should to creates notifications file' do
        expect(notifications_file_exist).to be_truthy
      end

      it 'notifications file content to be equivalent "reject_to_work!" method notification' do
        expect(notifications_file_content).to eq(method_notification)
      end
    end

    context 'when the notifications file exist' do
      context 'when the notifications file is empty' do
        before do
          File.open('Siarhei_Pratasevich_notifications.txt', 'w', &:close)
          subject.reject_to_work!(homework, student)
        end

        it 'append "reject_to_work!" method notification to empty notifications file (notification file content to be equivalent method notification)' do
          expect(notifications_file_content).to eq(method_notification)
        end
      end

      context 'when the notifications file is not empty' do
        let(:last_notifications_file_line) { File.readlines('Siarhei_Pratasevich_notifications.txt').last(2).join }

        before do
          File.open('Siarhei_Pratasevich_notifications.txt', 'w') do |f|
            f.write("New homework\n")
            f.close
          end
          subject.reject_to_work!(homework, student)
        end

        it 'appends new notification to notifications file (last file line to be equivalent method "reject_to_work!" notification)' do
          expect(last_notifications_file_line).to eq(method_notification)
        end

        it 'Last notifications file line not to be equivalent all notifications file' do
          expect(last_notifications_file_line).not_to eq(notifications_file_content)
        end
      end
    end
  end

  describe '#accept!' do
    let(:homework) { Homework.new(title: 'HW03', description: '5!(factorial). Using method reduce', student: student) }

    let(:method_notification) do
      "#{Time.new
      .strftime('%d-%m-%Y %H:%M:%S')} Good job! HW03 \"5!(factorial). Using method reduce\" - accepted! (Jack Gonsales)\n".yellow
    end

    after do
      File.delete('Siarhei_Pratasevich_notifications.txt')
    end

    context 'when the file notification do not exist' do
      let(:notifications_file_exist) { File.file? 'Siarhei_Pratasevich_notifications.txt' }

      before { subject.accept!(homework, student) }

      it '"accept!" method should to creates notifications file' do
        expect(notifications_file_exist).to be_truthy
      end

      it 'notifications file content to be equivalent "accept!" method notification' do
        expect(notifications_file_content).to eq(method_notification)
      end
    end

    context 'when the notifications file exist' do
      context 'when the notifications file is empty' do
        before do
          File.open('Siarhei_Pratasevich_notifications.txt', 'w', &:close)
          subject.accept!(homework, student)
        end

        it 'append "accept!" method notification to empty notifications file (notification file content to be equivalent method notification)' do
          expect(notifications_file_content).to eq(method_notification)
        end
      end

      context 'when the notifications file is not empty' do
        let(:last_notifications_file_line) { File.readlines('Siarhei_Pratasevich_notifications.txt').last(2).join }

        before do
          File.open('Siarhei_Pratasevich_notifications.txt', 'w') do |f|
            f.write("New homework\n")
            f.close
          end
          subject.accept!(homework, student)
        end

        it 'appends new notification to notifications file (last file line to be equivalent method "accept!" notification)' do
          expect(last_notifications_file_line).to eq(method_notification)
        end

        it 'Last notifications file line not to be equivalent all notifications file' do
          expect(last_notifications_file_line).not_to eq(notifications_file_content)
        end
      end
    end
  end
end

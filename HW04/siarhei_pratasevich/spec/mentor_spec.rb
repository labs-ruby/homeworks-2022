require_relative 'spec_helper'

RSpec.describe Mentor do
  subject { described_class.new(name: 'Jack', surname: 'Gonsales') }

  let(:student) { Student.new(name: 'Siarhei', surname: 'Pratasevich') }
  let(:homework) { Homework.new(title: 'HW03', description: '5!(factorial). Using method reduce', student: student) }
  let(:notifications_file_exist) { File.file? 'Siarhei_Pratasevich_notifications.txt' }
  let(:notifications_file_content) {File.read('Siarhei_Pratasevich_notifications.txt')}
  let(:last_notifications_file_line) { File.readlines('Siarhei_Pratasevich_notifications.txt').last(2).join }

  describe '#add_homework' do
    subject do
      described_class.new(name: 'Jack', surname: 'Gonsales').add_homework(title: 'HW03',
                                                                          description: '5!(factorial). Using method reduce', student: student)
    end
    let(:homework_file_content) {File.read('Siarhei_Pratasevich_homework.txt')}
    let(:notification_for_notifications_file) {"#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} New homework: HW03 \"5!(factorial). Using method reduce\" for Siarhei Pratasevich\n"}
    let(:notification_for_homework_file) { "#{Time.new.strftime('%d-%m-%Y %H:%M:%S')} homework: HW03 \"5!(factorial). Using method reduce\" for Siarhei Pratasevich\n" }

    context 'when notifications and homework files do not exist' do
      let(:homework_file_exist) { File.file? 'Siarhei_Pratasevich_homework.txt' }
      after(:all) do
        File.delete('Siarhei_Pratasevich_notifications.txt')
        File.delete('Siarhei_Pratasevich_homework.txt')
      end

      it 'method should to returns object Homework class' do
        expect(subject).to be_kind_of(Homework)
      end
      
      it 'method should to creates homework file' do
        expect(homework_file_exist).to be_truthy
     end

      it 'homework file content should to be equivalent homework title and description' do
        expect(homework_file_content).to eq(notification_for_homework_file)
      end

      it 'method should to creates notifications file' do
        expect(notifications_file_exist).to be_truthy
     end

      it 'notifications file content should to be equivalent new homework title and description' do
        expect(notifications_file_content).to eq(notification_for_notifications_file)
      end
    end
    
    context 'when notifications and homework files exist' do
      
       let!(:add_notification_file) do
         File.open('Siarhei_Pratasevich_notifications.txt', 'w') do |f|
           f.write("New homework\n")
           f.close
         end
       end
      
       let!(:add_homework_file) do
         File.open('Siarhei_Pratasevich_homework.txt', 'w') do |f|
           f.write("New homework\n")
           f.close
         end
       end

       let!(:create_new_subject_for_each_example) { subject }

       after(:each) do
        File.delete('Siarhei_Pratasevich_notifications.txt')
        File.delete('Siarhei_Pratasevich_homework.txt')
      end

      it 'method should to returns object Homework class' do
        expect(subject).to be_kind_of(Homework)
      end

      it 'should to overwrite old homework file content to new homework title and description' do
        expect(homework_file_content).to eq(notification_for_homework_file)
      end


      it 'should to overwrite old notifications file content to new homework title and description' do
        expect(notifications_file_content).to eq(notification_for_notifications_file)
      end
    end
  end
end

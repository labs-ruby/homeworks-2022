# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Student do
  let(:student) { described_class.new(name: 'TestName', surname: 'TestSurname') }
  let(:mentor) { Mentor.new(name: 'Test', surname: 'Testov') }
  let(:notification) { Notification.new(title: 'TestTitle', description: 'TestDescription') }
  let(:homework) do
    Homework.new(title: 'TestTitle',
                 description: 'TestDescription',
                 student: student,
                 mentor: mentor)
  end

  describe '#notify_mentor' do
    context 'when arguments are valid' do

      it 'changes notification list of mentor' do
        student.notify_mentor(mentor, 'TestDescription')
        expect(mentor.notifications_list).to include(an_object_having_attributes(description: 'TestDescription'))
      end
    end

    context 'when no arguments given' do
      it 'raises ArgumentError' do
        expect { student.notify_mentor }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#mark_as_read!' do

    context 'when notifiications is unread' do
      before { student.notifications_list.push(notification) }

      it 'makes all notifictions as read' do
        student.mark_as_read!
        expect(student.notifications_list).to all(have_attributes(status: 'read'))
      end
    end

    context 'when notifications is read' do
      before do
        notification.status = 'read'
        student.notifications_list.push(notification)
      end

      it "doesn't make changes" do
        expect { student.mark_as_read! }.not_to change(student, :notifications_list)
      end
    end
  end

  describe '#to_work!' do
    subject { student.to_work!(homework) }

    context 'when homework is not Homework.class instance' do
      let(:homework) { 404 }

      it 'raises NoMethodError' do
        expect { subject }.to raise_error(NoMethodError)
      end
    end

    context 'when no argument given' do
      it 'raises ArgumentError' do
        expect { student.to_work! }.to raise_error(ArgumentError)
      end
    end

    context 'when argument is valid' do
      it 'changes notification list of mentor' do
        expect { subject }.to change(mentor, :notifications_list)
      end
    end
  end

  describe '#add_answer!' do
    subject do
      student.add_answer!(homework, 'TestAnswer')
      homework
    end

    context 'when homework is not Homework.class instance' do
      let(:homework) { 404 }

      it 'raises NoMethodError' do
        expect { subject }.to raise_error(NoMethodError)
      end
    end

    context 'when no argument given' do
      it 'raises ArgumentError' do
        expect { student.add_answer! }.to raise_error(ArgumentError)
      end
    end

    context 'when argument is valid' do
      it 'changes homework answer' do
        expect { subject }.to change(homework, :answer).from(nil).to('TestAnswer')
      end

      it 'changes notification list of mentor' do
        expect { subject }.to change(mentor, :notifications_list).from([]).to([Notification])
      end
    end
  end

  describe '#to_check!' do
    subject { student.to_check!(homework) }

    context 'when homework is not Homework.class instance' do
      let(:homework) { 404 }

      it 'raises NoMethodError' do
        expect { subject }.to raise_error(NoMethodError)
      end
    end

    context 'when no argument given' do
      it 'raises ArgumentError' do
        expect { student.to_check! }.to raise_error(ArgumentError)
      end
    end

    context 'when argument is valid' do
      it 'changes notification list of mentor' do
        expect { subject }.to change(mentor, :notifications_list)
      end
    end
  end

  describe '#homeworks' do
    subject { student.homeworks }

    context 'when student has homeworks' do
      before { student.homeworks_list.push(homework) }

      it 'prints current homeworks' do
        expect { subject }.to output("Homework #{homework.title}: #{homework.description}\n").to_stdout
      end
    end

    context 'when student has 0 homeworks' do
      it 'prints nothing' do
        expect { subject }.to output('').to_stdout
      end
    end
  end

  describe '#notifications' do
    subject { student.notifications }

    context 'when student has only unread notifications' do
      before { student.notifications_list.push(notification) }

      let(:expectation) do
        <<~OUT
          New notification:
           #{notification.title}, #{notification.description}
        OUT
      end

      it 'prints unread notifications' do
        expect { subject }.to output(expectation).to_stdout
      end
    end

    context 'when student has only read notification' do
      before do
        notification.status = 'read'
        student.notifications_list.push(notification)
      end

      let(:expectation) { "0 notification to read\n" }

      it 'prints info message' do
        expect { subject }.to output(expectation).to_stdout
      end
    end

    context 'when student has 0 notification' do
      let(:expectation) { "0 notification to read\n" }

      it 'prints info message' do
        expect { subject }.to output(expectation).to_stdout
      end
    end
  end
end

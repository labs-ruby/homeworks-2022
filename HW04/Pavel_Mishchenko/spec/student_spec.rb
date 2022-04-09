# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Student do
  let(:student) { described_class.new(name: 'TestName', surname: 'TestSurname') }
  let(:mentor) { Mentor.new(name: 'Test', surname: 'Testov') }
  let(:notification1) { Notification.new(title: 'TestTitle1', description: 'TestDescription1') }
  let(:notification2) { Notification.new(title: 'TestTitle2', description: 'TestDescription2') }

  describe '#notify_mentor' do
    context 'when student notifies mentor' do
      subject do
        student.notify_mentor(mentor, 'TestDescription')
        mentor.notifications_list
      end

      it 'changes notification list of mentor' do
        expect(subject).to include(an_object_having_attributes(description: 'TestDescription'))
      end
    end

    context "when method hasn't arguments" do
      subject { student.notify_mentor }

      it 'raises ArgumentError' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#mark_as_read!' do
    context 'when notifiications is unreaded' do
      before do
        student.notifications_list.push(notification1)
        student.notifications_list.push(notification2)
      end

      it 'makes all notifictions as readed' do
        student.mark_as_read!
        expect(student.notifications_list).to all(have_attributes(status: 'read'))
      end
    end

    context 'when notifications is read' do
      subject { student.mark_as_read! }

      before do
        notification1.status, notification2.status = 'read'
        student.notifications_list.push(notification1)
        student.notifications_list.push(notification2)
      end

      it "doesn't make changes" do
        expect { subject }.not_to change(student, :notifications_list)
      end
    end
  end

  describe '#to_work!' do
    subject { student.to_work!(homework) }

    let(:homework) do
      Homework.new(title: 'TestTitle',
                   description: 'TestDescription',
                   student: student,
                   mentor: mentor)
    end

    context 'when homework is not Homework.class instance' do
      let(:homework) { 404 }

      it 'raises NoMethodError' do
        expect { subject }.to raise_error(NoMethodError)
      end
    end

    context "when method hasn't arguments" do
      subject { student.to_work! }

      it 'raises ArgumentError' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context 'when student takes to work his homework' do
      it 'changes notification list of mentor' do
        expect { subject }.to change(mentor, :notifications_list).from([])
      end
    end
  end

  describe '#add_answer!' do
    subject do
      student.add_answer!(homework, 'TestAnswer')
      homework
    end

    let(:homework) do
      Homework.new(title: 'TestTitle',
                   description: 'TestDescription',
                   student: student,
                   mentor: mentor)
    end

    context 'when homework is not Homework.class instance' do
      let(:homework) { 404 }

      it 'raises NoMethodError' do
        expect { subject }.to raise_error(NoMethodError)
      end
    end

    context "when method hasn't arguments" do
      subject { student.add_answer! }

      it 'raises ArgumentError' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context "when method hasn't answer" do
      subject { student.add_answer!(homework) }

      it 'raises ArgumentError' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context 'when student adds answer to homework' do
      it 'changes homework answer' do
        expect { subject }.to change(homework, :answer).to('TestAnswer')
      end

      it 'changes notification list of mentor' do
        expect { subject }.to change(mentor, :notifications_list).from([]).to([Notification])
      end
    end
  end

  describe '#to_check!' do
    subject { student.to_work!(homework) }

    let(:homework) do
      Homework.new(title: 'TestTitle',
                   description: 'TestDescription',
                   student: student,
                   mentor: mentor)
    end

    context 'when homework is not Homework.class instance' do
      let(:homework) { 404 }

      it 'raises NoMethodError' do
        expect { subject }.to raise_error(NoMethodError)
      end
    end

    context "when method hasn't arguments" do
      subject { student.to_check! }

      it 'raises ArgumentError' do
        expect { subject }.to raise_error(ArgumentError)
      end
    end

    context 'when student sends to check homework' do
      it 'changes notification list of mentor' do
        expect { subject }.to change(mentor, :notifications_list)
      end
    end
  end

  describe '#homeworks' do
    subject { student.homeworks }

    let(:homework) do
      Homework.new(title: 'TestTitle',
                   description: 'TestDescription',
                   student: student,
                   mentor: mentor)
    end

    context 'when student has homeworks' do
      before do
        student.homeworks_list.push(homework)
      end

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
      before do
        student.notifications_list.push(notification1)
        student.notifications_list.push(notification2)
      end

      let(:expectation) do
        <<~OUT
          New notification:
           #{notification1.title}, #{notification1.description}
          New notification:
           #{notification2.title}, #{notification2.description}
        OUT
      end

      it 'prints unread notifications' do
        expect { subject }.to output(expectation).to_stdout
      end
    end

    context 'when student has read and unread notifications' do
      before do
        notification2.status = 'read'
        student.notifications_list.push(notification1)
        student.notifications_list.push(notification2)
      end

      let(:expectation) do
        <<~OUT
          New notification:
           #{notification1.title}, #{notification1.description}
        OUT
      end

      it 'prints unread notifications' do
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

# frozen_string_literal: true

RSpec.describe Student do
  subject { described_class.new(name: 'Petr', surname: 'Petrov') }

  let(:homework) { Homework.new(title: 'title', description: 'fake', student: subject) }

  describe '#homeworks' do
    let(:file_name1) { 'homework.txt' }
    let(:user) { instance_double(described_class) }

    before do
      allow(user).to receive(:homeworks).and_return([file_name1])
    end

    it 'return file' do
      expect(user.homeworks).to eq([file_name1])
    end
  end

  describe '#to_work!' do
    before do
      allow(homework).to receive(:add_student_observer)
      allow(homework).to receive(:to_work!)
    end

    it 'wait homework.add_student_observer call' do
      subject.to_work!(homework)
      expect(homework).to have_received(:add_student_observer)
    end

    it 'wait homework.to_work! call' do
      subject.to_work!(homework)
      expect(homework).to have_received(:to_work!)
    end
  end

  describe '#add_answer!' do
    context "with answer = 'i dont know'" do
      before do
        allow(homework).to receive(:add_answer!).with('i dont know')
      end

      it 'wait homework.reject! call with answer = i dont know' do
        subject.add_answer!(homework, 'i dont know')
        expect(homework).to have_received(:add_answer!).with('i dont know')
      end
    end

    context 'without answer' do
      before do
        allow(homework).to receive(:add_answer!)
      end

      it 'wait homework.reject! call' do
        subject.add_answer!(homework)
        expect(homework).to have_received(:add_answer!)
      end
    end
  end

  describe '#to_check!' do
    context "with answer = 'i dont know'" do
      before do
        allow(homework).to receive(:to_check!)
      end

      it 'wait homework.reject! call with answer = i dont know' do
        subject.to_check!(homework)
        expect(homework).to have_received(:to_check!)
      end
    end
  end

  describe '#update' do
    include_examples 'update'
  end
end

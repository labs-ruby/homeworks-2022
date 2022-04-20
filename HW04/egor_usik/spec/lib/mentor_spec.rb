# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
RSpec.describe Mentor do
  subject(:create) { described_class.new(name: 'John', surname: 'Doe') }

  describe '#initialize' do
    context 'when no arguments are given' do
      it 'returns an error' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#add_homework' do
    context 'when adds new homework' do
      let(:student_class) { Student.new(name: 'James', surname: 'Chris') }

      it 'increments homeworks value by 1' do
        # student = instance_double("Student", :name => 'James', :description => 'Sam')
        expect { create.add_homework(title: 'Test HW', description: 'Test desc', student: student_class) }
          .to change { create.homeworks.count }.by(1)
      end
    end

    context 'when args are not given' do
      it 'returns an error' do
        expect { create.add_homework }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#reject_to_work!' do
    context 'when args are not given' do
      it 'returns an empty array' do
        expect { create.reject_to_work! }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#subscribe_to!' do
    context 'when subject subscribes to smbd' do
      let(:student_class) { Student.new(name: 'James', surname: 'Chris') }

      it 'changes count of subscriptions of the subject' do
        expect { create.subscribe_to!(student_class) }.to change { create.subscriptions.count }.by(1)
      end
    end

    context 'when subject subscribes to nobody' do
      it 'returns an error' do
        expect(create.subscribe_to!(nil)).to be_nil
      end
    end

    context 'when subject subscribes with no args' do
      it 'returns an error' do
        expect { create.subscribe_to! }.to raise_error(ArgumentError)
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength

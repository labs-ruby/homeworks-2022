# frozen_string_literal: true

RSpec.describe FileManager do
  let(:foo_class) { Class.new { include FileManager } }
  let(:dir) { 'spec/helpers' }
  let(:file_name) { 'test.txt' }

  describe '.create_file' do
    context 'when succes create file' do
      after do
        File.delete('spec/helpers/test.txt')
      end

      it 'creates file' do
        expect(foo_class.new.create_file(dir, file_name)).to be_a_kind_of(File)
      end
    end
  end

  describe '.add_data' do
    context 'when data present' do
      before do
        File.open('spec/helpers/test.txt', 'a+')
        3.times do
          foo_class.new.add_data(dir, file_name, '!')
        end
      end

      after do
        File.delete('spec/helpers/test.txt')
      end

      it 'Each line have data' do
        File.open("#{dir}/#{file_name}", 'r').each do |line|
          expect(line.chomp).to eq('!')
        end
      end
    end

    context 'when data empty' do
      before do
        File.open('spec/helpers/test.txt', 'a+')
        3.times do
          foo_class.new.add_data(dir, file_name, '')
        end
      end

      after do
        File.delete('spec/helpers/test.txt')
      end

      it 'Each line empty' do
        File.open("#{dir}/#{file_name}", 'r').each do |line|
          expect(line.chomp).to eq('')
        end
      end
    end
  end

  describe '.read_dir' do
    context 'when there is a file' do
      before do
        File.open('spec/helpers/test.txt', 'a+')
      end

      after do
        File.delete('spec/helpers/test.txt')
      end

      it 'show file name' do
        expect(foo_class.new.read_dir(dir)).to include('test.txt')
      end
    end

    context 'when the directory is empty' do
      it 'show array without files names' do
        expect(foo_class.new.read_dir(dir)).to eq(['..', '.'])
      end
    end
  end
end

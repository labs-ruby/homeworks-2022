# frozen_string_literal: true

require 'fileutils'

module FileManager
  def create_file(dir, file)
    create_dir(dir)
    File.open("#{dir}/#{file}", 'a+') unless File.exist?(file)
  end

  def add_data(dir, file, data)
    create_dir(dir)
    File.open("#{dir}/#{file}", 'a+') do |open_file|
      open_file.puts("#{data}\n")
      open_file.close
    end
  end

  def show(dir, file)
    File.open("#{dir}/#{file}") do |open_file|
      open_file.each { |line| puts line }
      open_file.close
    end
  end

  def read_dir(dir)
    Dir.open(dir, &:entries)
  end

  private

  def create_dir(dir)
    FileUtils.mkdir_p(dir) unless Dir.exist?(dir)
  end
end

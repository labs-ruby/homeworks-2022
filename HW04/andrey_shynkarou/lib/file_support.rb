# frozen_string_literal: true

module FileSupport
  private

  def read_task_file(filename)
    task_file = File.open(filename, 'r')
    task_file.each_line { |line| puts line }
    task_file.close
  end

  def write_to_task_file(filename, message)
    task_file = File.open(filename, 'w')
    task_file.write(message)
    task_file.close
  end

  def notification_storage_empty(filename)
    task_file = File.open(filename, 'w')
    task_file.close
  end
end

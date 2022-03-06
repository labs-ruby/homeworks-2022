# frozen_string_literal: true

def reload_file(name, task_number)
  Object.send(:remove_const, 'Homework3') if Object.const_defined?('Homework3')
  Dir["#{name.downcase}/#{name.downcase}_hw_03_t_0#{task_number}.rb"].each do |file|
    load file
  end
end

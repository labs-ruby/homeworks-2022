# frozen_string_literal: true

REG = /\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}.\d/

module Mod
  def pars(logs)
    logs.split("\n").select { |i| i.match('Calling core with action:') }.each { |i| i.to_s unless i }
  end

  def true_strs(arr)
    arr.reduce([]) { |data, i| data << i.match(REG).to_s.gsub(/[-\s:]/, '*').split('*').map(&:to_f) }
  end

  def time(data)
    data.reduce([]) do |t, i|
      t << Time.utc(i[0], i[1], i[2], i[3], i[4], i[5]).ceil(2)
    end
  end

  def res(tim)
    minus(tim.reverse).reduce([]) { |arr, i| arr << (i[0] - i[1]).ceil(1).to_s }
  end

  def minus(tim)
    tim.map { [tim.delete_at(0), tim[0]] }
  end
end

class Homework3
  include Mod
  def task3(logs)
    return '0' if pars(logs).length <= 1

    res = res(time(true_strs(pars(logs))))
    res.length == 1 ? res.first : res.reverse
  end
end

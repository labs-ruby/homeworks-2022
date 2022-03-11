# frozen_string_literal: true

REG = /\d{4}-\d{2}-\d{2}\s\d{2}:\d{2}:\d{2}.\d/

module Mod
  def pars(logs)
    logs.split("\n").select { |i| i.match('Calling core with action:') }.each { |i| i.to_s unless i }
  end

  def res(tim)
    res = []
    tim.each do
      res << (tim[-1] - tim[-2]).ceil(1).to_s if tim.length >= 2
      tim.delete_at(-1)
    end
    res
  end

  def time(data)
    t = []
    data.each do |i|
      t << Time.utc(i[0], i[1], i[2], i[3], i[4], i[5]).ceil(2)
    end
    t
  end
end

class Homework3
  include Mod
  def task3(logs)
    data = []
    arr = pars(logs)
    return '0' if arr.length <= 1

    arr.each { |i| data << i.match(REG).to_s.gsub(/[-\s:]/, '*').split('*').map(&:to_f) }
    t = time(data)
    res = res(t)
    res.length == 1 ? res.first : res.reverse
  end
end

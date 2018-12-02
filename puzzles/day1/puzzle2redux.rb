require 'set'

adjustments = File.read('input.txt').lines.map(&:to_i)
found = nil
current_frequency = 0
frequencies = Set.new
until found
  adjustments.each do |a|
    unless frequencies.add?(current_frequency += a)
      found = current_frequency
      break
    end
  end
end
puts "The first duplicated frequency is: #{found}"

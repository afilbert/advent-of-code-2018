adjustments = File.read('input.txt').lines.map(&:to_i)
start = 0
found = nil
frequencies = []
loop do
  adjustments.each do |e|
    frequencies << start += e
    if frequencies.uniq.length != frequencies.length
      found = frequencies.last
      break
    end
  end
  puts "End of list value: #{start}"
  break if found
end
puts "The first duplicated frequency is: #{found}"

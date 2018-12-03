input = File.read('input.txt').lines
twos = threes = 0
input.each do |line|
  groups = line.each_char.group_by { |e| e }
  twos += 1 if groups.select { |_k, v| v.size == 2 }.any?
  threes += 1 if groups.select { |_k, v| v.size == 3 }.any?
end
puts "Checksum is: #{twos * threes}"

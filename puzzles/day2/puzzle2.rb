input = File.read('input.txt').lines
common = nil
input.each do |line|
  input.each do |line_comp|
    id1 = line.split('')
    id2 = line_comp.split('')
    diff = id1.map { |char| char == id2.shift ? char : nil }
    if diff.select(&:nil?).count == 1
      common = diff.reject(&:nil?)
      break
    end
  end
  break if common
end
puts "Common characters across IDs: #{common.join('')}"

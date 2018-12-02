input = File.read('input.txt')
puts "Your resulting frequency is: #{input.lines.map(&:to_i).reduce(&:+)}"

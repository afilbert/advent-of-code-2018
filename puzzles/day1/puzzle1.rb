puts "Your frequency is: #{File.read('input.txt').lines.map(&:to_i).sum}"
